class Message < ActiveRecord::Base
  attr_accessible :message, :phone, :user_id, :to, :from, :balance, :charges
	# has_one :contact
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :message, :presence => true, length: { maximum: 600 }
  # validates :contact_id, :presence => true, on: :update
  validates :user_id, :presence => true
  validates :to, :presence => true
  validates :from, :presence => true
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  contact_id :integer
#  phone      :decimal(, )
#  to         :decimal(, )
#  from       :decimal(, )
#
# Indexes
#
#  index_messages_on_user_id_and_created_at  (user_id,created_at)
#
