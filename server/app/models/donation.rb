class Donation < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :donor, :class_name => 'User'
  belongs_to :referer, :class_name => 'User'
end
