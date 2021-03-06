require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email,  :password, 
                                  :password_confirmation, 
                                  :sroute, :salt_fragment, 
                                  :phone, :email_fwd, :admin,
                                  :balance, :charges

  has_many :contacts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :billing

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

  validates :password, :presence    => true,
                        :confirmation => true,
                        :length       => { :within => 8..128 },
                        on: :create
 

  validates :phone, :presence     => true,
                    :format       => { :with => phone_regex },
                    :uniqueness   => true

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def feed
    Message.where("user_id =?", id)
  end

  def salty_route
    sroute = self.salt[0..6]
  end

  private
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#  phone              :string(255)
#  email_fwd          :boolean          default(FALSE)
#  billing_id         :integer
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
