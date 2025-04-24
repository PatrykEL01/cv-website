# Portfolio Website on AWS S3

This project contains the source code and Infrastructure as Code (IaC) for my personal portfolio website, hosted on AWS S3 with CloudFront as the CDN.

## 🚀 Project Overview

The goal of this project is to create a simple, static website showcasing my professional experience, projects, and skills. The site is built using HTML and TailwindCSS, and the infrastructure is managed using Terraform.

## ✨ Features

*   **Static Hosting:** The website is hosted on AWS S3.
*   **CDN:** Amazon CloudFront ensures fast resource loading worldwide and handles HTTPS.
*   **Infrastructure as Code (IaC):** AWS resources (S3 bucket, CloudFront distribution) are managed by Terraform.
*   **Responsive Design:** The site is adapted to various screen sizes thanks to TailwindCSS.

## 🛠️ Technologies

*   **Frontend:** HTML, TailwindCSS
*   **Cloud:** AWS (S3, CloudFront)
*   **IaC:** Terraform
*   **CI/CD:** (Planned) GitHub Actions

## 🏗️ Infrastructure (Terraform)

Terraform configuration files are located in the `terraform/` directory. They define the following resources:

*   `aws_s3_bucket`: S3 bucket for storing website files.
*   `aws_s3_bucket_website_configuration`: Static website hosting configuration for the bucket.
*   `aws_s3_bucket_public_access_block` & `aws_s3_bucket_acl`: Public access settings for the bucket.
*   `aws_cloudfront_distribution`: CloudFront distribution pointing to the S3 website endpoint.

## ⚙️ Setup and Deployment

### Prerequisites

*   AWS Account
*   Terraform installed (>= 1.0)
*   AWS credentials configured (e.g., via environment variables or `aws configure`)

### Infrastructure Deployment Steps

1.  Navigate to the `terraform` directory:
    ```bash
    cd terraform
    ```
2.  Initialize Terraform:
    ```bash
    terraform init
    ```
3.  (Optional) Create a `terraform.tfvars` file or use environment variables to set `s3_bucket_name` (ensure the name is globally unique). You can also use the `prod.tfvars` file:
    ```bash
    terraform plan -var-file="prod.tfvars"
    ```
4.  Apply the Terraform configuration:
    ```bash
    terraform apply -var-file="prod.tfvars"
    ```
    Confirm by typing `yes`.

### Website Files Deployment

1.  After the infrastructure is created, copy the contents of the `static/` directory to the created S3 bucket. You can do this manually via the AWS console or using the AWS CLI:
    ```bash
    aws s3 sync ../static/ s3://<YOUR-BUCKET-NAME> --acl public-read
    ```
    Replace `<YOUR-BUCKET-NAME>` with the bucket name defined in Terraform (e.g., `patryk-leszczynski-portfolio-prod`).

2.  The website should be accessible via the CloudFront distribution URL (you can find it in the Terraform outputs or the AWS console).

## 📞 Contact

If you have questions or suggestions, feel free to contact me:

*   **LinkedIn:** [Patryk Leszczyński](https://www.linkedin.com/in/patryk-leszczy%C5%84ski-918a4220b/)
*   **GitHub:** [PatrykEL01](https://github.com/PatrykEL01)
*   **Email:** patryk.leszczynski006@gmail.com
