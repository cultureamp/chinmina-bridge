package main

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	jwtmiddleware "github.com/auth0/go-jwt-middleware/v2"
	"github.com/jamestelfer/ghauth/internal/buildkite"
	"github.com/jamestelfer/ghauth/internal/config"
	"github.com/jamestelfer/ghauth/internal/jwt"

	"github.com/justinas/alice"
)

func configureServerRoutes(cfg config.Config) error {
	authorizer, err := jwt.Middleware(cfg.Authorization, jwtmiddleware.WithErrorHandler(jwt.LogErrorHandler()))
	if err != nil {
		return fmt.Errorf("authorizer configuration failed: %w", err)
	}

	bk := buildkite.New(cfg.Buildkite)
	gh := func(ctx context.Context, repositoryURL string) (string, error) {
		return "token for " + repositoryURL, nil
	}

	vendor := IssueTokenForPipeline(bk.RepositoryLookup, gh)

	http.Handle("POST /token", alice.New(authorizer).Then(handlePostToken(vendor)))

	return nil
}

func main() {
	err := launchServer()
	if err != nil {
		fmt.Printf("server failed: %v\n", err)
		os.Exit(1)
	}
}

func launchServer() error {
	cfg, err := config.Load(context.Background())
	if err != nil {
		return fmt.Errorf("configuration load failed: %w", err)
	}

	err = configureServerRoutes(cfg)
	if err != nil {
		return fmt.Errorf("server routing configuration failed: %w", err)
	}

	err = serveHTTP(cfg.Server)
	if err != nil {
		return fmt.Errorf("server failed: %w", err)
	}

	return nil
}

func serveHTTP(serverCfg config.ServerConfig) error {
	// capture signals to gracefully shutdown the server
	signalChan := make(chan os.Signal, 1)
	signal.Notify(signalChan, syscall.SIGINT)

	server := &http.Server{Addr: fmt.Sprintf(":%d", serverCfg.Port)}

	// Start the server in a new goroutine
	var serverErr error
	go func() {
		fmt.Printf("Starting server on port %d\n", serverCfg.Port)
		err := server.ListenAndServe()
		if err != nil && err != http.ErrServerClosed {
			fmt.Printf("Error starting server: %v\n", err)
			serverErr = err

			// signal the main goroutine to exit gracefully
			signalChan <- syscall.SIGINT
		}
	}()

	sig := <-signalChan
	fmt.Printf("Received server shutdown signal: %v\n", sig)

	// Gracefully stop the server, allow up to 25 seconds for in-flight requests to complete
	// TODO config timeout
	ctx, cancel := context.WithTimeout(context.Background(), 25*time.Second)
	defer func() {
		// additional shutdown handling if required
		cancel()
	}()

	err := server.Shutdown(ctx)
	if err != nil {
		return fmt.Errorf("server shutdown failed: %w", err)
	}

	// if shutdown is successful but startup failed, the process should exit
	// with an error
	return serverErr
}
