# module ModelConfig
#   def self.configure
#     migration = Aws::Record::TableMigration.new(MyModel)
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
#
# ModelConfig.configure