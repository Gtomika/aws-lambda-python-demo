variable "aws_region" {
  type = string
}

variable "aws_key_id" {
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  type = string
  sensitive = true
}
