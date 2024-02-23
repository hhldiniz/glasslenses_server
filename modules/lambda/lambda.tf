resource "aws_lambda_function" "browser_request_handler" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  runtime = var.runtime
  handler = var.handler
  filename = var.filename

  depends_on = [data.archive_file.lambda_package]
}

data "archive_file" "lambda_package" {
  output_path = "./${var.filename}"
  type        = "zip"
}