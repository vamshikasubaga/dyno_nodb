require 'test_helper'

class RegulatoryInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regulatory_information = regulatory_informations(:one)
  end

  test "should get index" do
    get regulatory_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_regulatory_information_url
    assert_response :success
  end

  test "should create regulatory_information" do
    assert_difference('RegulatoryInformation.count') do
      post regulatory_informations_url, params: { regulatory_information: { exported_from_us: @regulatory_information.exported_from_us, fda_regulated_device: @regulatory_information.fda_regulated_device, fda_regulated_drug: @regulatory_information.fda_regulated_drug, nci_id: @regulatory_information.nci_id, ped_postmarket_surv: @regulatory_information.ped_postmarket_surv, post_prior_to_approval: @regulatory_information.post_prior_to_approval } }
    end

    assert_redirected_to regulatory_information_url(RegulatoryInformation.last)
  end

  test "should show regulatory_information" do
    get regulatory_information_url(@regulatory_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_regulatory_information_url(@regulatory_information)
    assert_response :success
  end

  test "should update regulatory_information" do
    patch regulatory_information_url(@regulatory_information), params: { regulatory_information: { exported_from_us: @regulatory_information.exported_from_us, fda_regulated_device: @regulatory_information.fda_regulated_device, fda_regulated_drug: @regulatory_information.fda_regulated_drug, nci_id: @regulatory_information.nci_id, ped_postmarket_surv: @regulatory_information.ped_postmarket_surv, post_prior_to_approval: @regulatory_information.post_prior_to_approval } }
    assert_redirected_to regulatory_information_url(@regulatory_information)
  end

  test "should destroy regulatory_information" do
    assert_difference('RegulatoryInformation.count', -1) do
      delete regulatory_information_url(@regulatory_information)
    end

    assert_redirected_to regulatory_informations_url
  end
end
