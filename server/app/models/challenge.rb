class Challenge < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  belongs_to :team
  has_many :donations
end
