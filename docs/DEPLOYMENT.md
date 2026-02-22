# Deployment Guide

This guide provides detailed instructions for deploying the DevOps Lab application to various environments.

## Table of Contents

- [Local Development](#local-development)
- [Docker Deployment](#docker-deployment)
- [Kubernetes Deployment](#kubernetes-deployment)
- [Cloud Deployment](#cloud-deployment)

## Local Development

### Prerequisites
- Node.js 16+ and npm
- Git

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/viraj16-art/devops-collaboration-lab.git
   cd devops-collaboration-lab
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create environment file:
   ```bash
   cp .env.example .env
   ```

4. Start the application:
   ```bash
   npm start
   ```

5. Access the application at `http://localhost:3000`

## Docker Deployment

### Using Docker

1. Build the image:
   ```bash
   docker build -t devops-lab-app:latest .
   ```

2. Run the container:
   ```bash
   docker run -d -p 3000:3000 --name devops-lab devops-lab-app:latest
   ```

3. Check logs:
   ```bash
   docker logs devops-lab
   ```

### Using Docker Compose

1. Start services:
   ```bash
   docker-compose up -d
   ```

2. View logs:
   ```bash
   docker-compose logs -f
   ```

3. Stop services:
   ```bash
   docker-compose down
   ```

## Kubernetes Deployment

### Prerequisites
- kubectl configured
- Access to a Kubernetes cluster

### Deployment Steps

1. Create namespace:
   ```bash
   kubectl apply -f k8s/namespace.yaml
   ```

2. Apply configurations:
   ```bash
   kubectl apply -f k8s/configmap.yaml
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   kubectl apply -f k8s/hpa.yaml
   ```

3. Verify deployment:
   ```bash
   kubectl get all -n devops-lab
   ```

4. Access the application:
   ```bash
   kubectl port-forward svc/devops-lab-service 3000:80 -n devops-lab
   ```

### Using Helm (Future Enhancement)

Consider creating a Helm chart for easier deployment:
```bash
helm install devops-lab ./helm-chart
```

## Cloud Deployment

### AWS Deployment with Terraform

1. Configure AWS credentials:
   ```bash
   aws configure
   ```

2. Initialize Terraform:
   ```bash
   cd terraform
   terraform init
   ```

3. Review plan:
   ```bash
   terraform plan
   ```

4. Apply infrastructure:
   ```bash
   terraform apply
   ```

5. Get cluster credentials:
   ```bash
   aws eks update-kubeconfig --name devops-lab-cluster --region us-east-1
   ```

6. Deploy application to EKS:
   ```bash
   kubectl apply -f k8s/
   ```

### CI/CD Deployment

The application automatically deploys through GitHub Actions on:
- Push to main branch
- Creation of version tags

To trigger a deployment:
```bash
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

## Monitoring and Troubleshooting

### Check Application Health

```bash
curl http://localhost:3000/health
```

### View Logs

**Docker:**
```bash
docker logs devops-lab
```

**Kubernetes:**
```bash
kubectl logs -f deployment/devops-lab-app -n devops-lab
```

### Common Issues

1. **Port already in use:**
   - Change PORT in .env file
   - Stop conflicting services

2. **Container won't start:**
   - Check Docker logs
   - Verify environment variables

3. **Kubernetes pod not ready:**
   - Check pod events: `kubectl describe pod <pod-name> -n devops-lab`
   - Verify ConfigMap exists
   - Check resource limits

## Rollback

### Docker
```bash
docker stop devops-lab
docker rm devops-lab
docker run -d -p 3000:3000 --name devops-lab devops-lab-app:previous-version
```

### Kubernetes
```bash
kubectl rollout undo deployment/devops-lab-app -n devops-lab
```

### Terraform
```bash
terraform plan -destroy
terraform destroy
```
