Task no1: Infrastructure Setup
b. An object storage bucket for storing static content.

Created a S3 bucket and copied files from local machine to S3 bucket by terraform HCl codein AWS console

Terraform description:
Created HCL code for S3 bucket by attaching the access and secret key and enabled bucket versioning by HCL code.Here, Nindex.html is created and saved in local folder which is used for upload to s3 bucket

Github guide:

1.terraform file link named main-s3-basic.tf”

https://github.com/thulasiramteja/Repozitory_technologies/blob/87a4fb4e4cafdc9b4238b8e5cac8964a8e403145/Repozitory-Technologies/task1/b/Main-s3-basic.tf


2. index.html file link
https://github.com/thulasiramteja/Repozitory_technologies/blob/87a4fb4e4cafdc9b4238b8e5cac8964a8e403145/Repozitory-Technologies/task1/b/file/index.html

Methods to follow:
1. create a folder in any location and open the folder from vscode for terraform, and create a terraform file by VScode or any other

2. create a folder named “file” and copy and paste the index.html file from github to folder

3. Copy and paste necessary HCL code in VScode from github.

4. use commands for deploying in VScode in command prompt or powershell

$ terraform init

$ terraform plan

$ terraform apply –auto-approve

$ terraform destroy –auto-approve

5. output can be seen as nodejs folder is copied from local machine to s3 bucket with bucket versioning status on.

Note:
1.for s3 region please use “us-west-2” in region section.

2.Index.html is created in a simple way by me

3.ubuntu v22.04 ami is used in ec2 instance in aws console

