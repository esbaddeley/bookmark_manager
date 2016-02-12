require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, :required => true, format: :email_address, unique: true, messages: {presence: 'You need to enter an email address', format: 'Not a valid email address'}
  property :password_hash, String, length: 100
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: 'Passwords do not match, please try again'

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end


end
