class User < ActiveRecord::Base
  validates :username, :email, presence: :true, uniqueness: true
  validates :email, format: { with: /.+@.+\..+/,
    message: "must look something like someone@example.com" }

  has_secure_password

  has_many :posts, class_name: "Post"
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
end
