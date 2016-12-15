require 'test_helper'

class EleveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @eleve = Eleve.new(nom: "Example Eleve", email: "eleve@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @eleve.valid?
  end

  test "email addresses should be unique" do
    duplicate_eleve = @eleve.dup
    @eleve.save
    assert_not duplicate_eleve.valid?
  end

  test "password should be present (nonblank)" do
    @eleve.password = @eleve.password_confirmation = " " * 6
    assert_not @eleve.valid?
  end

  test "password should have a minimum length" do
    @eleve.password = @eleve.password_confirmation = "a" * 5
    assert_not @eleve.valid?
  end
end
