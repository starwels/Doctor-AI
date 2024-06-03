require "test_helper"

class ClinicalCasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clinical_cases_index_url
    assert_response :success
  end

  test "should get new" do
    get clinical_cases_new_url
    assert_response :success
  end

  test "should get create" do
    get clinical_cases_create_url
    assert_response :success
  end
end
