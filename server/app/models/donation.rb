class Donation < ActiveRecord::Base
  before_save :default_values

  belongs_to :challenge
  belongs_to :donor, :class_name => 'User'
  belongs_to :referrer, :class_name => 'User'

  validates_presence_of :value, :message => ": oops, looks like you didn't tell me how much you were donating"
  validates_presence_of :donor, :message => ": i can't find anyone with that donor ID"
  validates_presence_of :referrer, :message => ": i can't find anyone with that referrer ID"
  validates_numericality_of :value, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100000000, :message => ": please donate at least $1"

  def as_json(options)
    result = super({
      :only => [:currency, :value],
      :include => {
        donor: { only: [:id, :name] },
        referrer: { only: [:id, :name] },
        challenge: { only: [:name, :target] }
    }}.merge(options))

    result = result.reject { |a,b| b.nil? }
    result
  end

  private
  def default_values
    (self.currency ||= 'USD').upcase
    self.challenge_id = 1
  end
end
