data aws_iam_policy_document "lambda_policy_data" {
  statement {
    sid = "AllowLambdaToLog"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_policy" "lambda_policy" {
  policy = data.aws_iam_policy_document.lambda_policy_data.json
}

data aws_iam_policy_document "lambda_assume_policy_data" {
  statement {
    sid = "AllowToBeAssumedByLambda"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_policy_data.json
  description = "Execution role for Python Lambda Test project lambdas"
}

resource "aws_iam_role_policy_attachment" "lambda_execution_attach_policy" {
  policy_arn = aws_iam_policy.lambda_policy.arn
  role       = aws_iam_role.lambda_execution_role.id
}