resource "aws_iam_role" "lambda_role" {
  assume_role_policy = jsonencode({
    "Version" = "2012-10-17"
    "Statement" = [
      {
        "Action" = "sts:AssumeRole"
        "Effect" = "Allow"
        "Principal" = {
          "Service" = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_role_policy" {
  policy = jsonencode({
    "Version" = "2012-10-17"
    "Statement" = [
      {
        "Action" = "logs:CreateLogGroup"
        "Effect" = "Allow"
        "Resource" = "*"
      },
      {
        "Action" = "logs:CreateLogStream"
        "Effect" = "Allow"
        "Resource" = "*"
      },
      {
        "Action" = "logs:PutLogEvents"
        "Effect" = "Allow"
        "Resource" = "*"
      }
    ]
  })
}