class User < ActiveRecord::Base
  # users.password_hash in database  is a :string
  include BCrypt

  validates :username, :password, :first_name, presence: true
  validates :username, uniqueness: true

  has_many :docs

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
