require 'test_helper'

class CompetencesControllerTest < ActionController::TestCase
  setup :initialize_competence

  def teardown
    @competence = nil
  end

  test 'should create competence' do
    assert_difference('Competence.count') do
      post :create, competence: { title: @competence.title,
                                  level: @competence.level,
                                  points: @competence.points,
                                  bill_id: @competence.bill }
    end
  end

  test 'should destroy competence' do
    assert_difference('Competence.count', -1) do
      delete :destroy, id: @competence.id
    end
  end

  private

  def initialize_competence
    @competence = competences(:competence1)
  end
end
