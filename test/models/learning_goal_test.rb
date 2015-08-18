require 'test_helper'

class LearningGoalTest < ActiveSupport::TestCase
  setup :initialize_learning_goal

  def teardown
    @learning_goal1 = nil
  end

  test 'should not create learning_goal without any input' do
    learning_goal = LearningGoal.new
    assert_not learning_goal.save, 'Saved a learning goal without any input'
  end

  test 'should not create learning_goal without goal' do
    learning_goal = LearningGoal.new(learned: @learning_goal1.learned,
                                     competence: @learning_goal1.competence)
    assert_not learning_goal.save, 'Saved a learning goal without goal'
  end

  test 'should not create learning_goal without learned' do
    learning_goal = LearningGoal.new(goal: @learning_goal1.goal,
                                     competence: @learning_goal1.competence)
    assert_not learning_goal.save, 'Saved a learning goal without learned'
  end

  test 'should not create learning_goal without competence' do
    learning_goal = LearningGoal.new(learned: @learning_goal1.learned,
                                     goal: @learning_goal1.goal)
    assert_not learning_goal.save, 'Saved a learning goal without competence'
  end

  private

  def initialize_learning_goal
    @learning_goal1 = learning_goals(:learning_goal1)
  end
end
