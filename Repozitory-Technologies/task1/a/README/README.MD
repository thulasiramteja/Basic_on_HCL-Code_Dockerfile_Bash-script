Task no1: Infrastructure Setup
a.- A Compute instance for the application server.

Deployed a apache2 web server by changing the index.html through echo by terraform HCl code in AWS console


Terraform description:
Created VPC, IGW, SUBNET, ROUTE TABLE, NETWORK INTERFACE AND ELASTIC IP by HCL commands and defined webserver installing commands in user defined section.


Github guide:
https://github.com/thulasiramteja/Repozitory_technologies/blob/f1e10d66c546bdafd2e194cd94ac409c16b12235/Repozitory-Technologies/task1/a/Main-webserver-apache2.tf

Methods to follow:
Firstly login to aws account and download aws access key and security key and save it in your local machine for futher purpose.

Because the key is downloaded only once. It cannot be downloaded more than one time.

1.create a folder for terraform, and create a terraform file by VScode or any other

2.Copy and paste HCL code in VScode

3.use commands for deploying in VScode in command prompt or powershell

$ terraform init

$ terraform plan

$ terraform apply –auto-approve

$ terraform destroy –auto-approve

4.output is seen in text format from index.html file and copy and paste the public ip address of machine

Ex For cloud services use public Ip



Note: the public Ip is assigned by elastic IP. Here, “EIP one” is used in the code. if public IP assign is not assign by the code in cloud please check the Elastic IP section and kindly delete the EIP if present and deploy the code again. The Public ip can be attached

ubuntu v22.04 ami is used in ec2 instance in aws console

