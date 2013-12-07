class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value.scan /^\+(\d+)[ \-\(]+/
    prefix = $1
    international = prefix.to_s.rjust(3, '0')
    phone = value.gsub /^\+#{prefix}/, international
    phone = phone.gsub /[\s\-\(\)]/, ''
    unless value =~ /^\d{8,20}$/i
      record.errors[attribute] << (options[:message] || "is not a phone number")
    end
  end
end

class User < ActiveRecord::Base
  has_many :teams
  has_many :donations
  has_many :challenges

  has_and_belongs_to_many :teams

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, uniqueness: true, email: true, allow_nil: true
  validates :phone, phone: true, allow_nil: true
  validate :phone_or_email_set

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

  def as_json(options)
    result = super({:only => [:id, :name, :email, :phone]}.merge(options))
    result = result.reject { |a,b| b.nil? }
    result
  end

  private
  def phone_or_email_set
    if email.blank? && phone.blank?
      errors[:base] << "Email or Phone must be provided"
    end
  end
end
