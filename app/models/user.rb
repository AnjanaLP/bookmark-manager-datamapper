require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,            Serial
  property :email,         String, format: :email_address, required: true
  property :password_hash, Text

  attr_accessor :password_confirmation

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address
end
