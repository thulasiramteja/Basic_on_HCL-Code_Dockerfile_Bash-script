provider "aws" {
    region = "us-east-1"
    access_key = "enter the access key"
    secret_key = "enter the secret key"
}

#create vpc
resource "aws_vpc" "testing_vpc" {
    cidr_block = "10.0.0.0/16"
        tags = {
            Name = "testing_vpc"
        }
 }

# create internet gateway
resource "aws_internet_gateway" "testing_gw" {
    vpc_id = aws_vpc.testing_vpc.id
    tags = {
        Name = "testing_igw"
    }
}

# create a route table
resource "aws_route_table" "testing_rw" {
  vpc_id = aws_vpc.testing_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testing_gw.id
  }
  
  tags = {
    Name = "testing"
  }
}

#create a subnet
resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.testing_vpc.id
    cidr_block = "10.0.0.0/18"
    availability_zone = "us-east-1a"
    tags = {
        Name = "testing_subnet1"
    }
}

#associate/attach subnet to route table
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.testing_rw.id
}

#create a security group to allow 22,80,443
resource "aws_security_group" "testing_web_allow_all" {
  name        = "testing_web_allow_all"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.testing_vpc.id

  ingress {
    description      = "HTTPS  "
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS  "
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

ingress {
    description      = "SSH  "
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "testing_web_allow_all"
  }
}
 
 #create a network interface with an ip in the subnet
 resource "aws_network_interface" "testing_webserver" {
  subnet_id       = aws_subnet.subnet_1.id
  private_ips     = ["10.0.0.17"]
  security_groups = [aws_security_group.testing_web_allow_all.id]

}

#assign an elastic ip to the network interface 
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.testing_webserver.id
  associate_with_private_ip = "10.0.0.17"
  depends_on = [aws_internet_gateway.testing_gw]
}

#create a ubuntu server and  install an apache2

resource "aws_instance" "testing_webserver" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    key_name = "terraform_testing"

    network_interface {
        device_index = 0
        network_interface_id = aws_network_interface.testing_webserver.id
        }
        tags = {
            Name = "testing_web_server"
        } 
        user_data = <<-EOF
                  #!/bin/bash
                  sudo apt-get update
                  sudo apt-get install -y apache2
                  sudo systemctl start apache2
                  sudo systemctl enable apache2
                  echo "Testing done under Thulasiramteja with "apache2 webserver by terraform code" for Repozitory Technologies" | sudo tee /var/www/html/index.html
                EOF
}