class Loss < ActiveRecord::Base
  belongs_to :entry
  belongs_to :record
  attr_accessible :entry, :record

  validates_existence_of :entry
end
