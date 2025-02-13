EMR Cluster Terraform Deployment

This repository contains the Terraform code to provision an EMR Cluster on AWS, configured with Flink and other applications such as Hadoop and Zeppelin. This example serves as a starting point that can easily be adapted to your business needs.

🐳 Dockerfile

This project includes a Dockerfile for creating a development environment with Terraform and AWS CLI pre-installed. It is designed to simplify setting up the required tools for provisioning resources on AWS.

Dockerfile Breakdown

Base Image: Uses the latest version of Ubuntu as the base.

Packages Installed:
wget, unzip, curl, git, openssh-client, iputils-ping for general utility and connectivity.
Terraform version 1.10.5 is downloaded, installed, and moved to /usr/local/bin/.
AWS CLI v2 is also installed to allow direct AWS service interaction from within the container.
Volume: The /iac directory is exposed as a volume for your Terraform infrastructure-as-code scripts.

How to Build and Run the Docker Image

To build and run the Docker container with the necessary tools:

Step 1: Build the Docker image:

docker build -t "name of image" .

Step 2: Run the Docker container:

docker run -dit --name "name of container" -v ./IaC:/iac "name of image" /bin/bash

This command will mount your local iac directory to the /iac folder inside the container, so you can directly work with your Terraform scripts in the containerized environment.

Step 3: Configure AWS CLI inside the container (before running Terraform):

aws configure

This step is mandatory so Terraform can authenticate and provision resources in your AWS account.

🚀 Overview
The code uses Terraform to provision:

EMR Cluster with Master and Core instance configurations.
Security with Security Groups, IAM Roles, and Key Pairs.
VPC with public subnets and network setup.
AWS EMR with Hadoop, Flink, and Zeppelin applications.
Bootstrap actions and Kerberos for advanced configurations.

Example configurations:
Instances: m5.xlarge type, with 1 Master instance and 2 Core instances.
EBS: 80 GB per Core instance.
Security: Rules for SSH on the Master instance and communication between Core nodes.
The parameters used are just examples and can be adapted according to your project's or company's needs.

🛠️ Prerequisites
Terraform 1.0+
AWS CLI configured with appropriate permissions.
AWS account with access to the EMR service and permission to create resources.

⚙️ How to Use
Step 1: Clone the Repository

git clone https://github.com/Beto-lima/AWS-ERM-APACHE_FLINK.git
cd your-repository

Step 2: Define Variables
Create a terraform.tfvars file to define the variables you want to customize.
Example:

project = "Flink-Deploy"
env = "EMR"
region = "us-east-2"
release_label = "emr-7.0.0"
main_instance_type = "m5.xlarge"
main_instance_count = 1
core_instance_type = "m5.xlarge"
core_instance_count = 2
Note: These parameters are just examples. You should adapt the variables according to your infrastructure and project needs.

Step 3: Initialize Terraform

terraform init

Step 4: Plan the Deployment

terraform plan

Step 5: Apply the Configuration

terraform apply

Step 6: Check the Outputs
After a successful apply, Terraform will generate some outputs, such as the public address of the EMR cluster.

terraform output emr_main_address

🔑 Access and Security
This project automatically creates IAM roles and Security Groups to manage access to the resources, including:

Key Pairs for SSH access to the Master node.
IAM roles for EMR and EC2.
Security Groups for communication between the nodes.
Make sure to review and adjust permissions according to your security policy.

🧑‍💻 Customizations
The following parameters can be easily customized:

EC2 Instances: Adjust instance types and quantities based on processing load and requirements.
EMR Applications: Add or remove applications as needed.
Network Configuration: Replace the VPC and subnet CIDR blocks according to your infrastructure.

📑 Contributions
Feel free to contribute improvements, fixes, or new features.

Fork this repository.
Create a branch for your changes (git checkout -b feature/new-feature).
Commit your changes (git commit -am 'Adding new feature').
Push to your branch (git push origin feature/new-feature).
Open a Pull Request.

📝 License
This project is licensed under the MIT License.

