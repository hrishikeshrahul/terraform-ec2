terraform {
  backend "s3" {
    bucket         = "prod-terraform-state-hrishi"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}