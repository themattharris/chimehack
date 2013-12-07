class User < ActiveRecord::Base
  has_many :teams
  has_many :donations
  has_many :challenges

  has_and_belongs_to_many :teams

  def has_contact_info?
    has_email? || has_phone?
  end

  def has_email?
    !email.blank?
  end

  def has_phone?
    !phone.blank?
  end

  def has_teams?
    teams.any?
  end
end
