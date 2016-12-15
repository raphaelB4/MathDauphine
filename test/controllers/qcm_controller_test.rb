require 'test_helper'

class QcmControllerTest < ActionDispatch::IntegrationTest
  test "should get exercice1" do
    get qcm_exercice1_url
    assert_response :success
  end

end
