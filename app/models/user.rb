require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,            Serial
  property :email,         String
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
end
