class Cart < ApplicationRecord
  has_many :lineitems, dependent: :destroy

  def add_items(product)
    line_item = self.lineitems.find_by(product_id: product.id)
    if line_item
      line_item.increment(:quantity)
    else
     line_item = self.lineitems.build(product_id:product.id,quantity:1)
    end
    line_item
  end

  def total_sum
    self.lineitems.to_a.sum { |lineitem| lineitem.total }
  end

  def total_item
    self.lineitems.to_a.sum {|lineitem| lineitem.quantity}
  end

end
