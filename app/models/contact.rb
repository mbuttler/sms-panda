class Contact < ActiveRecord::Base
  attr_accessible :phone, :name, :user_id
  # has_many :messages, dependent: :destroy
  # has_many :users, through: :messages
  belongs_to :user
  # accepts_nested_attributes_for :messages, allow_destroy: true



  validates :phone, :presence => true
  #not a bad plan eventually . . .
  validates :user_id, :presence => true

  def self.set_contact(sub_phone)
     @contact = Contact.find_or_create_by(phone: sub_phone)
  end
end

# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#
