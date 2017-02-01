require 'test_helper'

class StudentsSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
test "invalid signup information" do
    get new_student_path
    assert_no_difference 'Student.count' do
      post students_path, params: { student: { name:  "",
                                         email: "student@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'students/new'
  end

 test "valid signup information" do
    get signup_path
    assert_difference 'Student.count', 1 do
      post students_path, params: { student: { name:  "Example Student",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'students/show'
    assert is_logged_in?
  end
end
