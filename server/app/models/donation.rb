class Donation < ActiveRecord::Base
  before_save :default_values
  after_save :update_challenge_current_funds

  belongs_to :challenge
  belongs_to :donor, :class_name => 'User'
  belongs_to :referrer, :class_name => 'User'

  validates_presence_of :value, :message => ": oops, looks like you didn't tell me how much you were donating"
  validates_presence_of :donor, :message => ": i can't find anyone with that donor ID"
  validates_presence_of :referrer, :message => ": i can't find anyone with that referrer ID"
  validates_numericality_of :value, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100000000, :message => ": please donate at least $1"

  def value
    read_attribute(:value).to_f
  end

  def as_json(options)
    result = super({
      :only => [:currency, :value],
      :include => {
        donor: { only: [:id, :name] },
        referrer: { only: [:id, :name] },
        challenge: { only: [:name, :target, :current] }
    }}.merge(options))

    result = result.reject { |k,v| v.nil? }
  end

  private
  def default_values
    (self.currency ||= 'USD').upcase
    self.challenge_id = 1
  end

  def update_challenge_current_funds
    Challenge.update_raised_funds(self.challenge_id, self.value)
  end
end
