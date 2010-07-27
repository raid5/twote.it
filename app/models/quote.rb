class Quote < ActiveRecord::Base
  scope :pending, where(:approved => false)
  scope :approved, where(:approved => true)
end
