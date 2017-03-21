ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !session[:student_id].nil?
  end
  # Add more helper methods to be used by all tests here...

  def log_in_as(student)
    session[:student_id]=:student_id
  end

end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(student, password: 'password')
    post login_path, params: { session: { email: student.email,
                                          password: password } }
  end
end
