# DevOps Collaboration Lab

A comprehensive DevOps collaboration lab environment featuring a sample Node.js application with complete CI/CD pipelines, containerization, Kubernetes deployment, and Infrastructure as Code.

## 🚀 Features

- **Sample Application**: Node.js/Express REST API with health checks
- **Containerization**: Docker and Docker Compose configuration
- **CI/CD Pipelines**: GitHub Actions workflows for testing and deployment
- **Kubernetes**: Complete K8s manifests with auto-scaling
- **Infrastructure as Code**: Terraform configurations for AWS
- **Security**: Trivy vulnerability scanning and security best practices
- **Testing**: Jest unit tests with coverage reporting

## 📋 Prerequisites

- Node.js 16+ and npm
- Docker and Docker Compose
- kubectl (for Kubernetes deployments)
- Terraform (for infrastructure provisioning)
- AWS CLI (optional, for cloud deployments)

## 🏗️ Project Structure

```
.
├── src/                    # Application source code
│   └── index.js           # Main Express application
├── tests/                 # Test files
│   └── app.test.js       # Application tests
├── k8s/                   # Kubernetes manifests
│   ├── namespace.yaml    # Namespace configuration
│   ├── configmap.yaml    # ConfigMap for app configuration
│   ├── deployment.yaml   # Deployment specification
│   ├── service.yaml      # Service configuration
│   └── hpa.yaml          # Horizontal Pod Autoscaler
├── terraform/             # Infrastructure as Code
│   ├── main.tf           # Main Terraform configuration
│   ├── variables.tf      # Variable definitions
│   └── outputs.tf        # Output definitions
├── .github/workflows/     # CI/CD pipelines
│   ├── ci.yml            # Continuous Integration
│   └── docker.yml        # Docker build and push
├── Dockerfile             # Container image definition
├── docker-compose.yml     # Local development setup
└── package.json           # Node.js dependencies

```

## 🚀 Quick Start

### Local Development

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Run the application:**
   ```bash
   npm start
   ```

3. **Run tests:**
   ```bash
   npm test
   ```

4. **Run with coverage:**
   ```bash
   npm run test:coverage
   ```

### Docker

1. **Build the Docker image:**
   ```bash
   docker build -t devops-lab-app .
   ```

2. **Run the container:**
   ```bash
   docker run -p 3000:3000 devops-lab-app
   ```

3. **Or use Docker Compose:**
   ```bash
   docker-compose up
   ```

## 🔄 CI/CD Pipelines

### Continuous Integration (CI)

The CI pipeline runs on every push and pull request:

- **Linting**: ESLint code quality checks
- **Testing**: Runs tests across Node.js versions 16, 18, and 20
- **Coverage**: Generates test coverage reports
- **Security**: Trivy vulnerability scanning

### Continuous Deployment (CD)

The CD pipeline runs on pushes to main branch and version tags:

- **Docker Build**: Creates optimized container images
- **Registry Push**: Publishes to GitHub Container Registry
- **Security Scan**: Scans container images for vulnerabilities
- **Tagging**: Automatic versioning based on Git tags

## ☸️ Kubernetes Deployment

1. **Create namespace:**
   ```bash
   kubectl apply -f k8s/namespace.yaml
   ```

2. **Deploy ConfigMap:**
   ```bash
   kubectl apply -f k8s/configmap.yaml
   ```

3. **Deploy the application:**
   ```bash
   kubectl apply -f k8s/deployment.yaml
   ```

4. **Create service:**
   ```bash
   kubectl apply -f k8s/service.yaml
   ```

5. **Enable auto-scaling:**
   ```bash
   kubectl apply -f k8s/hpa.yaml
   ```

6. **Check deployment status:**
   ```bash
   kubectl get pods -n devops-lab
   kubectl get svc -n devops-lab
   ```

## 🏗️ Infrastructure Provisioning

### Using Terraform

1. **Initialize Terraform:**
   ```bash
   cd terraform
   terraform init
   ```

2. **Plan infrastructure changes:**
   ```bash
   terraform plan
   ```

3. **Apply infrastructure:**
   ```bash
   terraform apply
   ```

4. **Destroy infrastructure (when done):**
   ```bash
   terraform destroy
   ```

## 📊 API Endpoints

- `GET /` - Welcome message and status
- `GET /health` - Health check endpoint
- `GET /api/info` - Application information

### Example Usage

```bash
# Health check
curl http://localhost:3000/health

# Get app info
curl http://localhost:3000/api/info
```

## 🔒 Security

- Non-root container user
- Vulnerability scanning with Trivy
- Security best practices in Dockerfile
- Resource limits in Kubernetes
- Secrets management ready

## 🧪 Testing

```bash
# Run all tests
npm test

# Run tests with coverage
npm run test:coverage

# Run linter
npm run lint
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 📚 Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Terraform Documentation](https://www.terraform.io/docs/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
