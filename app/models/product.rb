class Product < ApplicationRecord
  self.per_page = 9
  attr_accessor :categorie_name
  belongs_to :categorie
  belongs_to :user
  has_one_attached :image
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                  message: "must be a valid image format" },
                                  size: { less_than: 5.megabytes,
                                  message: "should be less than 5MB" }


  def display_image
    image.variant(resize_to_limit: [500, 500])
  end

  def update_image

  end

end