.PHONY: help install test lint docker-build docker-run k8s-deploy clean

help: ## Show this help message
@echo 'Usage: make [target]'
@echo ''
@echo 'Available targets:'
@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
npm install

test: ## Run tests
npm test

test-coverage: ## Run tests with coverage
npm run test:coverage

lint: ## Run linter
npm run lint

docker-build: ## Build Docker image
docker build -t devops-lab-app:latest .

docker-run: ## Run Docker container
docker run -p 3000:3000 devops-lab-app:latest

docker-compose-up: ## Start services with Docker Compose
docker-compose up -d

docker-compose-down: ## Stop services with Docker Compose
docker-compose down

k8s-deploy: ## Deploy to Kubernetes
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/hpa.yaml

k8s-delete: ## Delete Kubernetes resources
kubectl delete -f k8s/

clean: ## Clean build artifacts
rm -rf node_modules coverage dist build
