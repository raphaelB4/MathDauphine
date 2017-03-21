require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

def setup
    @student = Student.new(name: "Example Eleve", email: "eleve@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @student.valid?
  end

  test "email addresses should be unique" do
    duplicate_student = @student.dup
    @student.save
    assert_not duplicate_student.valid?
  end

  test "password should be present (nonblank)" do
    @student.password = @student.password_confirmation = " " * 6
    assert_not @student.valid?
  end

  test "password should have a minimum length" do
    @student.password = @student.password_confirmation = "a" * 5
    assert_not @student.valid?
  end

  test "should solve and unsolve a problem" do
    bob = students(:bob)
    one  = exercices(:one)
    assert_not bob.has_solved?(one)
    bob.solve(one)
    assert bob.has_solved?(one)
    assert one.pupils.include?(bob)
    bob.unsolve(one)
    assert_not bob.has_solved?(one)
  end

end
