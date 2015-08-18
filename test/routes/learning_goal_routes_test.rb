require 'test_helper'

class LearningGoalRoutesTest < ActionController::TestCase
  test 'should route to create learning_goal' do
    assert_routing({ method: 'post', path: '/learning_goals' }, controller: 'learning_goals', action: 'create')
  end
end
