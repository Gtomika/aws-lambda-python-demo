provider "aws" {
  access_key = var.aws_key_id
  secret_key = var.aws_secret_key
  region = var.aws_region
  default_tags {
    tags = {
      application = "Python Lambda Test"
      managed_by = "Terraform"
      repository = "https://github.com/Gtomika/aws-lambda-python-demo"
      owner = "Tamas Gaspar"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "tamas-gaspar-epam-cloudx-terraform-state"
    key = "PythonLambdaTest.tfstate"
    region = "eu-central-1"
  }
}