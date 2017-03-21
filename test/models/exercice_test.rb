require 'test_helper'

class ExerciceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @chapitre= chapters(:one)
    # This code is not idiomatically correct.
    @exercice = @chapitre.exercices.build(issue: "C001", statement: "Un problème ouvert", answer: 42)
  end

  test "should be valid" do
    assert @exercice.valid?
  end

  test "chapter id should be present" do
    @exercice.chapter_id = nil
    assert_not @exercice.valid?
  end

end
