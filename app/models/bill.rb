class Bill < ActiveRecord::Base
  ### VALIDATIONS ###
  validates :name, presence: true
  validate :period_and_groupname, on: :update

  def period_and_groupname
    if (period.blank? || groupname.blank?)
      errors.add(:base, 'Vul de periode en groepsnaam in.')
    end
  end
end