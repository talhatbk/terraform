# Terraform CI/CD Pipeline with Manual Approval

This repository contains Terraform infrastructure code along with a GitHub Actions workflow that automates Terraform **plan**, **apply**, and **destroy** operations with manual approval gates.

## Features

- Automatically runs `terraform plan` on every push to the `main` branch.
- Uploads the plan as an artifact for review.
- Requires manual approval via GitHub Environments before applying changes.
- Supports manual triggering of `terraform destroy` through the GitHub Actions UI with approval.
- Uses AWS credentials securely stored in GitHub Secrets.

## Workflow Overview

- **Plan**: Runs on every push, generates and uploads a Terraform plan.
- **Apply**: Runs after manual approval in the `production` environment; downloads the plan and applies it.
- **Destroy**: Can be triggered manually from the GitHub Actions tab; requires approval before destroying resources.

## Prerequisites

- AWS credentials with appropriate permissions stored as GitHub Secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
- GitHub environment named `production` with required reviewers for manual approval.

## Usage

- Push your Terraform code changes to the `main` branch to trigger the plan job.
- Approve the apply job in the GitHub environment to apply changes.
- To destroy resources, manually trigger the workflow via the GitHub Actions UI and approve the destroy job.

---

