variable "lambda_function_name" {
    description = "The name of the Lambda function"
    type        = string
}

variable "runtime" {
    description = "The runtime of the Lambda function"
    type        = string
    default = "python3.10"
}

variable "lambda_role_arn" {
    description = "The ARN of the IAM role to use for the Lambda function"
    type        = string
}

variable "handler" {
  default = "main"
}
variable "filename" {
  default = "lambda_function.zip"
}