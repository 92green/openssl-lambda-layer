variable "layer_name" {
  default = "92green-openssl"
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = "lambda-layer-openssl.zip"
  source_code_hash = "${filebase64sha256("lambda-layer-openssl.zip")}"
  layer_name = var.layer_name
}

output "arn" {
    value = aws_lambda_layer_version.lambda_layer.arn
}

output "layer_arn" {
    value = aws_lambda_layer_version.lambda_layer.layer_arn
}

output "created_date" {
    value = aws_lambda_layer_version.lambda_layer.created_date
}

output "signing_job_arn" {
    value = aws_lambda_layer_version.lambda_layer.signing_job_arn
}

output "signing_profile_version_arn" {
    value = aws_lambda_layer_version.lambda_layer.signing_profile_version_arn
}

output "source_code_size" {
    value = aws_lambda_layer_version.lambda_layer.source_code_size
}

output "version" {
    value = aws_lambda_layer_version.lambda_layer.version
}