class Challenge < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  belongs_to :team
  has_many :donations

  class << self
    def update_raised_funds(id, pledge)
      c = Challenge.find(id)
      c.current += pledge
      c.save
    end
  end
end
