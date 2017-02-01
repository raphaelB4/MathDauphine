require 'test_helper'

class CorrectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 def setup
    @correction = Correction.new(scholar_id: students(:bob).id,
                                     problem_id: exercices(:one).id)
  end

  test "should be valid" do
    assert @correction.valid?
  end

  test "should require a scholar_id" do
    @correction.scholar_id = nil
    assert_not @correction.valid?
  end

  test "should require a problem_id" do
    @correction.problem_id = nil
    assert_not @correction.valid?
  end
end
