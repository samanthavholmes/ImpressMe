class Post < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :comments
  has_many :likes

end
