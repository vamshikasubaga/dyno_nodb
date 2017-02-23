def dynamodb_local
  @client ||= Aws::DynamoDB::Client.new region: "localhost",
                                        endpoint: "http://localhost:8000", access_key_id: "x",
                                        secret_access_key: "x"
end

def delete_table table_name
  dynamodb_local.delete_table table_name: table_name
rescue
end

def create_table table_name
  Rake::Task["dynamodb:create_table"].reenable
  Rake::Task["dynamodb:create_table"].invoke table_name
end