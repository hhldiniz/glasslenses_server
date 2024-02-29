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

data "aws_ssoadmin_instances" "identity_center" {}

resource "random_password" "pipeline_user_password" {
  length            = 16
  special           = true
  override_special  = "!@#$%^&*()_+"
}

resource "aws_identitystore_user" "pipeline_user" {
  count = var.pipeline_user_username != null ? 1 : 0

  display_name      = var.pipeline_user_display_name
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_center.identity_store_ids)[0]
  user_name         = var.pipeline_user_username

  name {
    family_name = var.pipeline_user_family_name
    given_name  = var.pipeline_user_given_name
  }
  connection {
    password = random_password.pipeline_user_password.result
  }
}