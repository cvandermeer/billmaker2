class LearningGoal < ActiveRecord::Base
  ### ASSOCIATIONS ###
  belongs_to :competence

  ### VALIDATIONS ###
  validates :goal, presence: true
  validates :learned, presence: true
  validates :competence_id, presence: true
end
