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

  def target
    read_attribute(:target).to_f
  end
  def current
    read_attribute(:current).to_f
  end
end
