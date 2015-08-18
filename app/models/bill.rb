class Bill < ActiveRecord::Base
  validates :name,       presence: true
  validates :period,     presence: true
  validates :groupname,  presence: true
end