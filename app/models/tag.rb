class Tag < ActiveRecord::Base
  validates :body, presence: true

  has_many :post_tags
  has_many :posts, through: :post_tags

  def self.build_from_string(string)
    string.split(",").map { |tag| Tag.where(body: tag.strip).first_or_create }
  end
end
