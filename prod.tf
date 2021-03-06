variable "whitelist" {
  type = list(string)
}
variable "web_image_id" {
  type = string
}
variable "web_instance_type" {
  type = string
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

}

provider "aws" {
  profile = "default"
  region = "ap-south-1"
}

resource "aws_s3_bucket" "prod_tf_course" {
  bucket = "tf-course-202203200833"
  tags =    {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "s3_name" {
  value = aws_s3_bucket.prod_tf_course.tags
}

output "s3_name_value" {
  value = s3_name.Name  
}


# resource "aws_s3_bucket" "prod_tf_course1" {
#   bucket = "tf-course-202203200834"
# }

# resource "aws_default_vpc" "default" {}

# resource "aws_security_group" "prod_web"{
#   name        = "prod_web"
#   description = "Allow standrad http and https inbound and everything outbound"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = var.whitelist
#   }
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = var.whitelist
#   }
#   egress {
#     from_port    = 0
#     to_port      = 0
#     protocol     = "-1"
#     cidr_blocks  = var.whitelist
#   }

#   tags = {
#     "Terraform" : "true"
#   }
# }

# resource "aws_instance" "prod_web" {
#   ami           = var.web_image_id
#   instance_type = var.web_instance_type

#   vpc_security_group_ids = [
#     aws_security_group.prod_web.id
#    ]

#   tags = {
#     "Terraform" : "true"
#   }
# }


