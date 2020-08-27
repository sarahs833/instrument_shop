class Categorie < ApplicationRecord
  has_many :products
  validates :name, uniqueness: true
  scope :with_name, -> { all.distinct.pluck(:name) }

  searchkick
  def search_data
    {
      name: name
    }
  end

end
