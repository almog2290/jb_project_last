# jb_project_last - Final Project

## Overview

This project is a comprehensive DevOps final project that includes application development, containerization, CI/CD pipeline setup, Kubernetes deployment, and infrastructure provisioning using Terraform.

## Application

The application is a Python-based project located in the `app/` directory.

### Files

- `main.py`: The main application code.
- `requirements.txt`: Python dependencies.
- `Dockerfile`: Dockerfile for containerizing the application.
- `Jenkinsfile`: Jenkins pipeline configuration.
- `.flake8`: Configuration for Flake8 linter.
- `azure-pipelines.yaml`: Azure Pipelines configuration.

## Kubernetes Manifests

The Kubernetes manifests are located in the `k8s-manifests/` directory.

### Files

- `deploymentApp.yaml`: Kubernetes deployment configuration for the application.
- `serviceApp.yaml`: Kubernetes service configuration for the application.

## Terraform

The Terraform configuration files are located in the `terraform/` directory.

### Files

- `provider.tf`: Configures the necessary providers.
- `ec2.tf`: Provisions EC2 instances.
- `network.tf`: Configures the network resources.
- `output.tf`: Defines the outputs of the Terraform configuration.
- `postInitInstallation.tf`: Post-initialization scripts.
- `variable.tf`: Defines input variables.