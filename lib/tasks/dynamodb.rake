task :create_table, [:table_name] => :environment do |_, args|
  table_json = # JSON params for creating table
      Dynamodb::Base.__create_table table_json if table_json.present?
end
