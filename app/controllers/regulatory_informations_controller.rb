require "aws-sdk-core"

class RegulatoryInformationsController < ApplicationController

  # before_action only: [:index] do
  #   #Rails.logger.info "***** Before Calling  ******"
  #   puts "***** Before Calling  ******"
  #   dynamodb = Aws::DynamoDB::Client.new
  #   params = RegulatoryInformation.new()
  # end
  # def index
  #   begin
  #     puts "***** Inside Calling  ******"
  #     result = dynamodb.create_table(params)
  #     puts "Created table. Status: " +
  #              result.table_description.table_status;
  #
  #   rescue  Aws::DynamoDB::Errors::ServiceError => error
  #     puts "Unable to create table:"
  #     puts "#{error.message}"
  #   end
  #
  # end

end
