class Incentive < ActiveRecord::Base
  def as_json(options)
    result = super({
      :only => [:value, :description]
    }.merge(options))
    result = result.reject { |a,b| b.nil? }
    result
  end
end
