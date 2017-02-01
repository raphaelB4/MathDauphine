require 'test_helper'

class ExerciceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @chapitre= chapters(:one)
    # This code is not idiomatically correct.
    @exercice = @chapitre.exercices.build()
  end

  test "should be valid" do
    assert @exercice.valid?
  end

  test "user id should be present" do
    @exercice.chapter_id = nil
    assert_not @exercice.valid?
  end

end
