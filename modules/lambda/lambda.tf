locals {
  browser_request_lambda_function_location = "${path.module}/browser_request_handler_lambda_function"
}

resource "aws_lambda_function" "browser_request_handler" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  runtime = var.runtime
  handler = var.handler
  filename = data.archive_file.lambda_package.output_path

  depends_on = [data.archive_file.lambda_package]
}

resource "aws_lambda_function_url" "browser_request_handler_url" {
  function_name      = aws_lambda_function.browser_request_handler.function_name
  qualifier          = "$LATEST"
  authorization_type = "AWS_IAM"
}

data "archive_file" "lambda_package" {
  output_path = "${local.browser_request_lambda_function_location}/${var.lambda_function_name}.zip"
  type        = "zip"
  source_dir = "${local.browser_request_lambda_function_location}/"
}