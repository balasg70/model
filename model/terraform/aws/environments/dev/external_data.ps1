# Get AWS credentials from environment variables or AWS CLI
try {
    # First try to get from environment variables
    $accessKey = $env:AWS_ACCESS_KEY_ID
    $secretKey = $env:AWS_SECRET_ACCESS_KEY

    # If not found in environment variables, try AWS CLI
    if (-not $accessKey -or -not $secretKey) {
        # Get default profile credentials using AWS CLI
        $awsCredentials = aws configure get aws_access_key_id
        $accessKey = $awsCredentials
        $secretKey = aws configure get aws_secret_access_key
    }

    # Create the JSON output structure
    $result = @{
        "AWS_ACCESS_KEY_ID" = $accessKey
        "AWS_SECRET_ACCESS_KEY" = $secretKey
    }

    # Output JSON
    $result | ConvertTo-Json -Compress

} catch {
    # In case of any error, output empty credentials
    @{
        "AWS_ACCESS_KEY_ID" = ""
        "AWS_SECRET_ACCESS_KEY" = ""
    } | ConvertTo-Json -Compress
    exit 1
}