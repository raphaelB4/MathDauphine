require 'test_helper'

class ExercicesCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @bob=students(:bob)
    @chapitre = chapters(:one)
    
  end

#=begin
  test "invalid exercice create information" do
    get new_exercice_path
    assert_no_difference 'Exercice.count' do
      post exercices_path, params: { exercice: { chapter_id:  2,
                                         statement: "Un problème ouvert",
                                         reponse:              42,
                                         solution: "C'est évident." } }
    end
  end
#=end

  test "valid exercice create information" do
    log_in_as(@bob)
    get new_exercice_path
    assert_difference 'Exercice.count', 1 do
 	post exercices_path, params: { exercice: { chapter_id:  @chapitre.id,
                                         statement: "Un problème ouvert",
                                         reponse:              42,
                                         solution: "C'est évident." } }
    end
    follow_redirect!
    assert_template "page_statique/listes"
  end
end
