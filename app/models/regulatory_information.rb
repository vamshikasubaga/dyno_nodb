class RegulatoryInformation
  include Aws::Record
  include Aws::Record::RecordClassMethods
  include Aws::Record::Query::QueryClassMethods

  include ActiveModel::Serializers::JSON
  #include ModelSerializer

  set_table_name "#{self.name.underscore}"

  boolean_attr :active, database_attribute_name: 'is_active_flag'
  string_attr :nci_id, hash_key: true
  string_attr :fda_regulated_drug
  string_attr :fda_regulated_device
  string_attr :post_prior_to_approval
  string_attr :ped_postmarket_surv
  string_attr :exported_from_us
  string_attr :date_created, range_key: true

end