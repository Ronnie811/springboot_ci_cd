# Spring Boot CI/CD Pipeline - Azure DevOps Example

## Overview

This repository contains a sample Spring Boot project with a fully modular CI/CD pipeline designed in Azure DevOps using YAML templates.

### Features:
- Docker image builder for compiling the Spring Boot project.
- Modular pipeline with separate stages for build, static analysis (SAST with SonarQube), release, and deployment.
- Publishing artifacts to GitHub Packages.
- Automated deployment to remote Linux server with health check.
- Infrastructure as Code style pipeline: fully scripted, no predefined tasks.
- Secure handling of secrets via Azure DevOps Variable Groups and Secure Files.

---

## Pipeline Structure

- `azure-pipelines.yml` - Main pipeline file that calls templates.
- `templates/build.yml` - Stage to build the project using Docker.
- `templates/sast.yml` - Stage to run static code analysis using SonarQube.
- `templates/release.yml` - Stage to publish the `.jar` artifact to GitHub Packages.
- `templates/deploy.yml` - Stage to deploy the application to a remote server.

---

## Requirements

- Azure DevOps project with pipeline configured.
- Docker Hub public repository with builder image.
- GitHub Personal Access Token (PAT) with `write:packages` and `read:packages` scopes stored as `GITHUB_TOKEN` variable group.
- SSH private key uploaded as Secure File in Azure DevOps.
- Remote Linux server accessible via SSH with Java installed.
- SonarQube server setup with project key and token configured.

---

## Usage

1. Clone this repository:

```bash
git clone https://github.com/Ronnie811/springboot_ci_cd.git
cd springboot_ci_cd
