require 'test_helper'

class LearningGoalsControllerTest < ActionController::TestCase
  setup :initialize_learning_goal

  def teardown
    @learning_goal = nil
  end

  test 'should create learning_goal' do
    assert_difference('LearningGoal.count') do
      post :create, learning_goal: { goal: @learning_goal1.goal,
                                     learned: @learning_goal1.learned,
                                     competence_id: @learning_goal1.competence }
    end
  end

  private

  def initialize_learning_goal
    @learning_goal1 = learning_goals(:learning_goal1)
  end
end
