class Product < ApplicationRecord
  self.per_page = 9

  belongs_to :categorie
  belongs_to :user
  has_one_attached :image
  attr_accessor :categorie_name
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                  message: "must be a valid image format" },
                                  size: { less_than: 5.megabytes,
                                  message: "should be less than 5MB" }
   CONDITION = %w{ New Excellent Mint Used Poor }

  searchkick word_start: [:brand]
  def search_data
    {
      brand: brand,
      price: price,
      categorie_name: categorie.name
    }
  end


  def display_image
    image.variant(resize_to_limit: [500, 500])
  end

  def categorie_name=(name)
    self.categorie = Categorie.find_or_create_by(name:name)
  end

  def category_name
      self.category ? self.category.name : nil
  end


end
