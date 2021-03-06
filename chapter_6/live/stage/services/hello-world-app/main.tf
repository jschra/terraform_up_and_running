terraform {
  required_version = "= 1.1.2"
  required_providers {
      aws = {
          source = "hashicorp/aws"
          # Allow any 2.x version of the AWS provider
          version = "~> 2.0"
      }
  }
}

provider "aws" {
  region = "us-east-2"
}
 

module "hello_world_app" {

  source = "github.com/JorScience/terraform_up_and_running//chapter_6/modules/services/hello-world-app?ref=v0.0.5"

  server_text = var.server_text

  environment            = var.environment
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key

  instance_type      = "t2.micro"
  min_size           = 2
  max_size           = 2
  enable_autoscaling = false
}