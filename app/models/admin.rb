class Admin < ActiveRecord::Base
  belongs_to :user
  belongs_to :ladder
  attr_accessible :user, :ladder

  validates_existence_of :user
end
