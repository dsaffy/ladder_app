class Ladder < ActiveRecord::Base
  has_many :admins
  has_many :entries
  has_many :records
  attr_accessible :name, :admins, :entries, :records

  validates :name, :presence => true, :length => { :maximum => 100 }
end
