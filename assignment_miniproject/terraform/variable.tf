variable "AWS_REGION" {
  default = "us-east-1"
}

variable "subnet_ids" {
  type = list(string)
  default = ["subnet-074fbd3becb6e05e4","subnet-0db2b63bfc3a9ece6","subnet-06fdc461dbae5d3a0"]
}