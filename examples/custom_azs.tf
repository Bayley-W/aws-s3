terraform {
  required_version = ">= 0.14.5"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "3.32.0"
      }
      kubernetes = {
        source = "hashicorp/kubernetes"
        version = "2.0.2"
      }
  }
}

provider "aws" {
  region  = "eu-west-2"
}

module "vpc" {
  source = "git@github.com:Bayley-W/aws-vpc.git"

  name       = "bwVPC"
  custom_azs = ["eu-west-2a", "eu-west-2b"]

  cidr_range             = "10.0.0.0/19"
  public_cidr_ranges     = ["10.0.4.0/22", "10.0.8.0/22"]
  public_subnets_per_az  = 1
  private_cidr_ranges    = ["10.0.12.0/22", "10.0.16.0/22"]
  private_subnets_per_az = 1
}
