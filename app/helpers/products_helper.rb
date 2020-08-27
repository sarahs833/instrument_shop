module ProductsHelper

  def can_edit_product(product)
    if current_user && current_user.products.include?(product)
       link_to "edit", edit_product_path(product)
    end
  end
end
