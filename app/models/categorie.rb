class Categorie < ApplicationRecord
  has_many :products
  validates :name, uniqueness: true
  scope :with_name, -> { all.distinct.pluck(:name) }

end
