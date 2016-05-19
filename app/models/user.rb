class User < ActiveRecord::Base
  validates :username, :email, presence: :true, uniqueness: true
  validates :email, format: { with: /.+@.+\..+/,
    message: "must look something like someone@example.com" }

  has_secure_password

  has_many :posts
  has_many :comments
end
