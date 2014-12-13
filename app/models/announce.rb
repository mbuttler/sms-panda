class Announce < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at
  validates :message,  :presence => true

  def self.current(hidden_ids = nil)
    result = where("starts_at <= :now and ends_at >= :now", now: Time.zone.now)
    result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
    result
  end
end

# == Schema Information
#
# Table name: announces
#
#  id         :integer          not null, primary key
#  message    :text
#  starts_at  :datetime
#  ends_at    :datetime
#  created_at :datetime
#  updated_at :datetime
#
