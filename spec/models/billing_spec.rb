require 'rails_helper'

RSpec.describe Billing, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: billings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  credits    :decimal(, )      default(0.0)
#  charges    :decimal(, )      default(0.0)
#  balance    :decimal(, )      default(0.0)
#  created_at :datetime
#  updated_at :datetime
#
