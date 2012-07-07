class User < ActiveRecord::Base
  has_many :admins
  has_many :entries
  has_many :records
  attr_accessible :first_name, :last_name, :email, :entries, :records, :admins

  validates_associated :admins, :entries, :records

  validates :first_name, :length => { :in => 2..25 }
  validates :last_name, :length => { :in => 2..25 }
  validates_presence_of :email
end
