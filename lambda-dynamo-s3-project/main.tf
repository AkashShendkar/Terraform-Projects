provider "aws" {
  region = "ap-south-1" 
}

# Create a DynamoDB table
resource "aws_dynamodb_table" "my_table" {
  name           = "MyTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Bucket"
  range_key      = "Key"
  attribute {
    name = "Bucket"
    type = "S"
  }
  attribute {
    name = "Key"
    type = "S"
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "bucketforlambda-akash124816" 
  acl    = "private"
}

# Create an IAM role for Lambda function
resource "aws_iam_role" "my_lambda_role" {
  name = "MyLambdaRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Attach policies to the Lambda role (for DynamoDB and S3 access)
resource "aws_iam_role_policy_attachment" "lambda_dynamodb" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = aws_iam_role.my_lambda_role.name
}

resource "aws_iam_role_policy_attachment" "lambda_s3" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.my_lambda_role.name
}

# Create Lambda function
resource "aws_lambda_function" "my_lambda" {
  function_name = "MyLambdaFunction"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "lambda_function.zip"
  source_code_hash = filebase64("lambda_function.zip")
  role          = aws_iam_role.my_lambda_role.arn
  environment = {
    TABLE_NAME = aws_dynamodb_table.my_table.name
  }
  depends_on = [aws_iam_role_policy_attachment.lambda_dynamodb, aws_iam_role_policy_attachment.lambda_s3]
}

