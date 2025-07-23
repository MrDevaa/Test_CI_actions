2. Déployer une fonction Lambda
Pour Lambda, c’est un peu plus complexe car il faut :

Avoir un fichier .zip avec ton code Python ou Node.js

Fournir un rôle IAM

Voici un exemple simple avec une fonction Lambda en Python :

a. Fichier main.py
def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': 'Hello from Lambda!'
    }

Tu zippes ce fichier :
 - zip function.zip main.py

b. Terraform

provider "aws" {
  region = "eu-west-3"
}

# IAM Role pour autoriser Lambda à s'exécuter
resource "aws_iam_role" "lambda_role" {
  name = "lambda_basic_execution"

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

# Attacher une politique de base
resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Fonction Lambda
resource "aws_lambda_function" "ma_lambda" {
  function_name = "hello_lambda"
  handler       = "main.lambda_handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  filename      = "function.zip"
  source_code_hash = filebase64sha256("function.zip")
}


Service	Code Terraform
S3	Très simple à créer, direct
Lambda	Nécessite un zip + un rôle IAM

