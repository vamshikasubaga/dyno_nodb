require "aws-sdk-core"

class RegulatoryInformationsController < ApplicationController

  dynamodb = Aws::DynamoDB::Client.new

  params = {
      table_name: "REGULATORYINFORMATION",
      key_schema: [
          {
              attribute_name: "nci_id",
              key_type: "HASH"  #Partition key
          },
          {
              attribute_name: "date_created",
              key_type: "RANGE" #Sort key
          },

      ],
      attribute_definitions: [
          {
              attribute_name: "nci_id",
              attribute_type: "S"
          },
          {
              attribute_name: "date_created",
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


end
