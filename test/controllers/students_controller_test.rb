require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
 
  def setup
    @student       = students(:bob)
    @other_student = students(:robert)
  end

 test "should get new" do
    get signup_path
    assert_response :success
  end



end
