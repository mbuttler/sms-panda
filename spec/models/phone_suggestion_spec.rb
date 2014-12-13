require 'rails_helper'

RSpec.describe PhoneSuggestion, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
