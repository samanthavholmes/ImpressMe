class Image < ActiveRecord::Base
  validates :url, presence: true

  has_many :posts
end
