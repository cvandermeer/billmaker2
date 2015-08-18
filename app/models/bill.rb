class Bill < ActiveRecord::Base
  ### VALIDATIONS ###
  validates :name, presence: true
  validate :period_and_groupname, on: :update

  def period_and_groupname
    errors.add(:base, 'Vul de periode en groepsnaam in.') if period.blank? || groupname.blank?
  end
end
