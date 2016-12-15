require 'test_helper'

class ChapitreControllerTest < ActionDispatch::IntegrationTest
  test "should get chapitre1" do
    get chapitre1_path
    assert_response :success
  end

  test "should get chapitre2" do
    get chapitre2_path
    assert_response :success
  end

end
