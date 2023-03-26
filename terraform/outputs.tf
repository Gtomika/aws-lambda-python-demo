output "lambda_execution_role_arn" {
  value = module.lambda_execution_role.lambda_execution_role_arn
}

output "greeter_lambda_arn" {
  value = module.lambda_function_greeter.lambda_arn
}

output "summer_lambda_arn" {
  value = module.lambda_function_summer.lambda_arn
}