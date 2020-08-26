module PasswordResetsHelper

  def to_currency(product)
    number_to_currency(product.price)
  end
end
