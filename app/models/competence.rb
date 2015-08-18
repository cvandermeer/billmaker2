class Competence < ActiveRecord::Base
  ### CONSTANTS ###
  cattr_accessor :competences, :points_options, :levels
  self.competences = ['Research & Innovation',
                      'Concepting',
                      'Multimedia Design',
                      'Multimedia Production',
                      'Quality Monitoring & Implementation',
                      'Multidisciplinary Teamwork',
                      'Communication',
                      'Project Management',
                      'Sharing',
                      'Growth & Reflection']
  self.points_options = [3, 6, 9, 12]
  self.levels = %w(Basis Gevorderd Expert)

  ### ASSOCIATIONS ###
  belongs_to :bill

  ### VALIDATIONS ###
  validates :title, presence: true
  validates :level, presence: true
  validates :points, presence: true
  validates :bill_id, presence: true
end
