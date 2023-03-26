## AWS Lambda in Python

Some extremely basic AWS Lambda functions in Python. Terraform is provided 
to deploy them. No lambda invocation is created in this project: to see these 
lambdas in action they must be manually invoked.

## Deploy

First make ZIP files of the `greeter_lambda/lambda_function.py` and the 
`sum_lambda/lambda_function.py`:

 - `greeter_lambda/lambda_function.py` -> `greeter_lambda.zip`
 - `sum_lambda/lambda_function.py` -> `sum_lambda.zip`

Bucket specified in the `terraform/provider.tf` file must exist. Or change file contents 
to your bucket. Make sure IAM user has the permissions to it.

Then run following terraform commands, filling in the necessary variables:

```bash
terraform init
terraform validate
terraform plan -out app.tfplan -var aws_region=eu-central-1 -var aws_key_id=[your key ID] -var aws_secret_key=[your secret key]
terraform apply "app.tfplan"
```

The IAM user must have the necessary permissions! To tear the infrastructure down:

```bash
terraform destory -var aws_region=eu-central-1 -var aws_key_id=[your key ID] -var aws_secret_key=[your secret key]
```