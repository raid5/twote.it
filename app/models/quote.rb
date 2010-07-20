class Quote < ActiveRecord::Base
  validates_presence_of :quote
  
  scope :pending, where(:approved => false)
  scope :approved, where(:approved => true)
end
