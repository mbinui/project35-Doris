provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami_owner]
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                 = var.tags
  name                 = var.vpc_name
}


# module "acm_certificate" {
#   source          = "./modules/acm_certificate"
#   domain_name     = var.domain_name
#   route53_zone_id = var.route53_zone_id
#   tags            = var.tags
# }


module "security_group" {
  source         = "./modules/security_group"
  sg_name        = "common_sg"
  sg_description = "Common security group for all instances"
  ingress_rules  = var.ingress_rules
  egress_rules   = var.egress_rules
  vpc_id         = module.vpc.vpc_id
}

module "jenkins_server" {
  source                      = "./modules/ec2_instance"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  instance_name               = var.jenkins_instance_name
  user_data                   = file("${path.module}/scripts/jenkins.sh")
  security_group_ids          = [module.security_group.sg_id]
  subnet_id                   = module.vpc.public_subnet_ids[0]
  associate_public_ip_address = var.associate_public_ip_address
}

module "terraform_server" {
  source                      = "./modules/ec2_instance"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  instance_name               = var.terraform_instance_name
  user_data                   = file("${path.module}/scripts/terraform.sh")
  security_group_ids          = [module.security_group.sg_id]
  subnet_id                   = module.vpc.public_subnet_ids[0]
  associate_public_ip_address = var.associate_public_ip_address
}

module "maven_sonarqube_server" {
  source                      = "./modules/ec2_instance"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.large"
  key_name                    = var.key_name
  instance_name               = var.maven_sonarqube_instance_name
  user_data                   = file("${path.module}/scripts/maven_sonarqube.sh")
  security_group_ids          = [module.security_group.sg_id]
  subnet_id                   = module.vpc.public_subnet_ids[0]
  associate_public_ip_address = var.associate_public_ip_address
}

module "dynamodb_table" {
  source         = "./modules/dynamodb_table"
  table_name     = var.dynamodb_table_name
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  tags           = var.tags
}

module "s3_bucket" {
  source             = "./modules/s3_bucket"
  bucket_name_prefix = var.bucket_name_prefix
  versioning         = var.versioning
  tags               = var.tags
}

module "ecr_repository" {
  source          = "./modules/ecr_repository"
  repository_name = var.repository_name
  tags            = var.tags
}

