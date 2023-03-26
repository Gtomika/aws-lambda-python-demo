resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  role          = var.execution_role_arn
  runtime = "python3.9"
  handler = "lambda_function.lambda_handler"
  description = var.function_description
  source_code_hash = filebase64(var.path_to_deployment_package)
  filename = var.path_to_deployment_package
}