import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MyTable')

def lambda_handler(event, context):
    # Retrieve information about the uploaded file
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    # Process the file and store data in DynamoDB
    # For simplicity, let's assume the file contains JSON data
    data = {"Bucket": bucket, "Key": key}
    table.put_item(Item=data)

    return {
        'statusCode': 200,
        'body': json.dumps('File processed and data stored in DynamoDB.')
    }
