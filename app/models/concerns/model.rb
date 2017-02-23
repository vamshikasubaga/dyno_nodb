def client
  @client ||= Aws::DynamoDB::Client.new(
      region: "localhost",
      access_key_id: "AKIAZ7TTTQQ6GYT6WQA",
      secret_access_key: "yUx5Avm8UGZWfrlgxGUFUfPepnGr8OdWG1Dcy36k",
      endpoint: "http://localhost:8000"
  )
end