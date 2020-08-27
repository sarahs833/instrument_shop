class Lineitem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    self.quantity * self.product.price
  end

  def check_quantity
    if self.quantity > 1
      self.decrement(:quantity)
    else
      self.destroy
    end
  end
end
