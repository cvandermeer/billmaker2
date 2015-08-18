class CreateLearningGoals < ActiveRecord::Migration
  def change
    create_table :learning_goals do |t|
      t.string :goal
      t.text :learned
      t.integer :competence_id
    end
  end
end
