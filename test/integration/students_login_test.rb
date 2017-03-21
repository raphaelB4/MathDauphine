require 'test_helper'

class StudentsLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
 def setup
    @student = students(:bob)
  end


  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

 test "login in with valid information" do
   get login_path
   post login_path, params: { session: {email: @student.email, password: 'password'} }
   assert_redirected_to @student
   follow_redirect!
   assert_template 'students/show'
   assert_select "a[href=?]", login_path, count: 0
   assert_select "a[href=?]", logout_path
   assert_select "a[href=?]", student_path(@student)

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", student_path(@student), count: 0
 end
end
