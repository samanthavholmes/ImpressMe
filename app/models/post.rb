class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :comments
  has_many :likes

  def has_comments?
    self.comments != []
  end
end
