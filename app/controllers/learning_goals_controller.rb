class LearningGoalsController < ApplicationController
  def create
    @learning_goal = LearningGoal.new(learning_goal_params)
    render @learning_goal, learning_goal: @learning_goal if @learning_goal.save
  end

  private

  def learning_goal_params
    params.require(:learning_goal).permit(:goal, :learned, :competence_id)
  end
end
