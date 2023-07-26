Task 2: Application Setup (Docker): -

Description:

Setting up an simple application web server from dockerfile. Here, nodejs application files such as index.js, package.json and package-lock.json as taken to deploy application for this task

In this task, create an s3 bucket named “r-technologies” and download the nodejs_files folder from github in your local machine and upload the nodejs_files in s3 bucket named . “rtechnologies”


Github guide:
1.dockerfile and command guide file link

https://github.com/thulasiramteja/Repozitory_technologies/blob/bb89f584b9f419fb6424d517d17bfa19f4291a7f/Repozitory-Technologies/task2/dockerfile.txt

https://github.com/thulasiramteja/Repozitory_technologies/blob/bb89f584b9f419fb6424d517d17bfa19f4291a7f/Repozitory-Technologies/task2/command.txt

2.nodejs_files folder link

https://github.com/thulasiramteja/Repozitory_technologies/tree/bb89f584b9f419fb6424d517d17bfa19f4291a7f/Repozitory-Technologies/task2/nodejs_files

Methods to follow:

1. login in to aws account and create an basic instance with ubuntu ami.

2.Download the nodejs_files folder from github

3. Create an s3 bucket named “r-technologies” and upload the downloaded folder to s3 bucket.

4. Connect to your instance with putty or direct connect.

5.Use commands to update machine and install docker

$ sudo apt-get update && sudo apt-get install docker.io -y

4 after installing docker check status of docker make sure it is in running.

5 make folder of test and change directory to test folder

6 create a dockerfile by command

$ Sudo nano dockerfile

7.Inside dockerfile copy and paste the respected command from github and save it

8.build the image by command

$ “ sudo docker build -t node-app --build-arg AWS_ACCESS_KEY="Enter the access key" --build-arg AWS_SECRET_KEY="enter the secret key" --build-arg S3_BUCKET="enter the bucket arn" --build-arg S3_REGION=us-west-2 . “

9.run the image by command

$ sudo docker run -p 3000 node-app

10.copy the public ip of machine and paste it in browser adding “:3000” port to it

11.output is seen as text “hello node” in the browser


Note:


Ubuntu v22.04 ami is used in ec2 instance in aws console

Nodejs files that are used in this task are downloaded by surfing through internet. Those files are not coded by me.

If Nodejs application not runned by port 3000 please check the docker container by running command.

$ sudo docker ps
