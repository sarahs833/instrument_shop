class Lineitem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    self.quantity * self.product.price
  end
end
