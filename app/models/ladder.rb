class Ladder < ActiveRecord::Base
  has_many :admins
  has_many :entries
  has_many :records
  attr_accessible :name, :admins, :entries, :records

  validate :validate_admins

  def validate_admins
    errors.add(:admins, "doesn't exit") if admins.count < 1
  end

  validates :name, :presence => true, :length => { :maximum => 100 }
end
