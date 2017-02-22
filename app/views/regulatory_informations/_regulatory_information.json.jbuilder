json.extract! regulatory_information, :id, :nci_id, :fda_regulated_drug, :fda_regulated_device, :post_prior_to_approval, :ped_postmarket_surv, :exported_from_us, :created_at, :updated_at
json.url regulatory_information_url(regulatory_information, format: :json)
