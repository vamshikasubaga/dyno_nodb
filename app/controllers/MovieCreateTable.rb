require "aws-sdk-core"

Aws.config.update({
                      region: "us-east-1",
                      endpoint: "http://localhost:8000"
                  })

dynamodb = Aws::DynamoDB::Client.new

params = {
    table_name: "CTRP_FDAAA",
    key_schema: [
        {
            attribute_name: "NCI_ID",
            key_type: "HASH"  #Partition key
        },
        {
            attribute_name: "Studies a U.S. FDA-regulated Drug Product",
            key_type: "RANGE" #Sort key
        }
    ],
    attribute_definitions: [
        {
            attribute_name: "NCI_ID",
            attribute_type: "S"
        },
        {
            attribute_name: "Studies a U.S. FDA-regulated Drug Product",
            attribute_type: "S"
        },

    ],
    provisioned_throughput: {
        read_capacity_units: 10,
        write_capacity_units: 10
    }
}

begin
  result = dynamodb.create_table(params)
  puts "Created table. Status: " +
           result.table_description.table_status;

rescue  Aws::DynamoDB::Errors::ServiceError => error
  puts "Unable to create table:"
  puts "#{error.message}"
end