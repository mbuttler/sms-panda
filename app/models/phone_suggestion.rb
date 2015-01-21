class PhoneSuggestion < ActiveRecord::Base
  attr_accessible :popularity, :phone
  belongs_to :user

  def self.phone_for(phone, uid)
    suggestions = where("phone like ? AND user_id = ?", "#{phone}_%", uid)
    suggestions.order("popularity desc").limit(10).pluck(:phone)
  end

  def self.index_phones
    Contact.find_each do |contact|
      index_phone(contact.phone, contact.user_id)
      # index_phone(contact.name)
      # index_phone(contact.phone) 
    end
  end

  def self.index_phone(phone, uid)
    where(phone: phone.to_s, user_id: uid).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
# == Schema Information
#
# Table name: phone_suggestions
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  popularity :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

# SELECT  "phone_suggestions"."phone" FROM "phone_suggestions"  WHERE (phone like '_%' AND user_id = 1)  ORDER BY popularity desc LIMIT 10
