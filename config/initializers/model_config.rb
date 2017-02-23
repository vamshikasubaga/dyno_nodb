# module ModelConfig
#   def self.configure
#     migration = Aws::Record::TableMigration.new(RegulatoryInformation)
#     migration.create!(
#         provisioned_throughput: {
#             read_capacity_units: 5,
#             write_capacity_units: 2
#         }
#     )
#     migration.wait_until_available
#   end
#
# end

# ModelConfig.configure

#Module Definition
module ModelConfig
  def self.configure
    configure_table(RegulatoryInformation)
    ensure_table(RegulatoryInformation)

    # configure_table(TreatmentArmAssignmentEvent)
    # ensure_table(TreatmentArmAssignmentEvent)
  end

  def self.configure_table(table)
    name = table.new.class.name.underscore
    name = name.to_s.split('/').last || ''
    table.set_table_name name
  end

  def self.ensure_table(table)
    read_capacity_units = Rails.configuration.environment.fetch('read_capacity_units').to_i
    write_capacity_units = Rails.configuration.environment.fetch('write_capacity_units').to_i

    unless table.table_exists?
      puts "====== Table [#{table.table_name}] does not exist. Creating the table ======"
      migration = Aws::Record::TableMigration.new(table)
      migration.create!(provisioned_throughput: { read_capacity_units: read_capacity_units,
                                                  write_capacity_units: write_capacity_units })
      migration.wait_until_available
    end
  end
end

ModelConfig.configure