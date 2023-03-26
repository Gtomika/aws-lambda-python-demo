module "lambda_execution_role" {
  source = "./iam"
}

module "lambda_function_greeter" {
  source = "./lambda"
  execution_role_arn = module.lambda_execution_role.lambda_execution_role_arn
  function_name = "PythonLambdaTestGreeter"
  function_description = "This demo lambda greets the user"
  path_to_deployment_package = "${path.module}/../greeter_lambda/greeter_lambda.zip"
}

module "lambda_function_summer" {
  source = "./lambda"
  execution_role_arn = module.lambda_execution_role.lambda_execution_role_arn
  function_name = "PythonLambdaTestSummer"
  function_description = "This demo lambda sums 2 numbers"
  path_to_deployment_package = "${path.module}/../sum_lambda/sum_lambda.zip"
}