module github.com/jamestelfer/chinmina-bridge

go 1.23.1

require (
	github.com/auth0/go-jwt-middleware/v2 v2.2.1
	github.com/aws/aws-sdk-go-v2 v1.27.2
	github.com/bradleyfalzon/ghinstallation/v2 v2.10.0
	github.com/buildkite/go-buildkite/v3 v3.11.0
	github.com/go-jose/go-jose/v4 v4.0.1
	github.com/go-logr/logr v1.4.2
	github.com/go-logr/zerologr v1.2.3
	github.com/golang-jwt/jwt/v4 v4.5.0
	github.com/google/go-github/v61 v61.0.0
	github.com/justinas/alice v1.2.0
	github.com/maypok86/otter v1.2.0
	github.com/rs/zerolog v1.32.0
	github.com/sethvargo/go-envconfig v1.0.1
	github.com/stretchr/testify v1.9.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.26.0
	go.opentelemetry.io/otel/sdk v1.26.0
	go.opentelemetry.io/otel/sdk/metric v1.26.0
)

require (
	github.com/aws/aws-sdk-go-v2/credentials v1.17.18 // indirect
	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.5 // indirect
	github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.9 // indirect
	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.9 // indirect
	github.com/aws/aws-sdk-go-v2/internal/ini v1.8.0 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.11.2 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.11.11 // indirect
	github.com/aws/aws-sdk-go-v2/service/sso v1.20.11 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssooidc v1.24.5 // indirect
	github.com/aws/aws-sdk-go-v2/service/sts v1.28.12 // indirect
	github.com/aws/smithy-go v1.20.2 // indirect
	github.com/cenkalti/backoff v1.1.1-0.20171020064038-309aa717adbf // indirect
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/dolthub/maphash v0.1.0 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/gammazero/deque v0.2.1 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/go-github/v60 v60.0.0 // indirect
	github.com/google/go-querystring v1.1.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.19.1 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/stretchr/objx v0.5.2 // indirect
	golang.org/x/net v0.23.0 // indirect
	golang.org/x/sys v0.19.0 // indirect
	gopkg.in/go-jose/go-jose.v2 v2.6.2 // indirect
)

require (
	github.com/aws/aws-sdk-go-v2/config v1.27.18
	github.com/aws/aws-sdk-go-v2/service/kms v1.31.1
	github.com/pmezard/go-difflib v1.0.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.51.0
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.51.0
	go.opentelemetry.io/otel v1.26.0
	go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc v1.26.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.26.0 // indirect
	go.opentelemetry.io/otel/exporters/stdout/stdoutmetric v1.26.0
	go.opentelemetry.io/otel/exporters/stdout/stdouttrace v1.26.0
	go.opentelemetry.io/otel/metric v1.26.0 // indirect
	go.opentelemetry.io/otel/trace v1.26.0 // indirect
	go.opentelemetry.io/proto/otlp v1.2.0 // indirect
	golang.org/x/crypto v0.21.0 // indirect
	golang.org/x/sync v0.6.0 // indirect
	golang.org/x/text v0.14.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20240227224415-6ceb2ff114de // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240401170217-c3f982113cda // indirect
	google.golang.org/grpc v1.63.2 // indirect
	google.golang.org/protobuf v1.33.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

// replaced as the OAuth middleware is depending on a version with a published vulnerability
replace gopkg.in/go-jose/go-jose.v2 v2.6.2 => gopkg.in/go-jose/go-jose.v2 v2.6.3
