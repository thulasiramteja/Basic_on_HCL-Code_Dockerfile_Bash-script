Task 3: Configuration Management:


Description:
Deploying a webserver such as nginx by docker image with index.html file located in S3 bucket by using bash script

Here index.html file is upload in s3 bucket named “dockers3bash” and been used in script. The aws access key and secret key are need to use in task.

Github guide:

Bash script, command guide file and index.html link:

https://github.com/thulasiramteja/Repozitory_technologies/tree/8b048e137d6eaf86ecb20c224d64e7a2d9a30bf3/Repozitory-Technologies/task3

Methods to follow:

1. login in to aws account and create an basic instance with ubuntu ami.

2. Create an s3 bucket named “dockers3bash” and upload index.html file from local machine.

3. Connect to your instance with putty or direct connect.

4. Create a folder “test” and change directory to “test” folder

5. Create a script file by using nano

$ sudo nano script.sh

6. Copy and paste the respected commands from github.

7. Run the command after saving the script

$ sudo chmod +x script.sh

$ ./script.sh

8. Copy the public Id of instance and paste it in browser adding 8080 port

9.Output is seen in text in the browser

Note:

Index.html is created in a simple way by me and differ from 
task 1b


ubuntu v22.04 ami is used in ec2 instance in aws console
