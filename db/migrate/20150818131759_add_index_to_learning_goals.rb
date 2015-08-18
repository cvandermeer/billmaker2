class AddIndexToLearningGoals < ActiveRecord::Migration
  def change
    add_index :learning_goals, :competence_id
  end
end
