run:
	@go run cmd/main.go

migrations:
	@sqlc generate

docker:
	@docker-compose up -build

test-unit:
	@go test -v -cover ./...

test-integration:
	@go test -v -cover ./... -tags=integration

test: test-unit test-integration
