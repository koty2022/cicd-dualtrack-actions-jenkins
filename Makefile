SHELL := /bin/bash

.PHONY: test docker-build deploy lint scan

# Run unit tests (placeholder)
test:
    @npm --prefix app test

# Build the Docker image locally
docker-build:
    @docker build -t myapp:local .

# Linting (placeholder)
lint:
    @echo "Linting..."

# Security scanning (placeholder)
scan:
    @echo "Security scanning..."

# Deploy to Kubernetes
deploy:
    @kubectl apply -f k8s/
