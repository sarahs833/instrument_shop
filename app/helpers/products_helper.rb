module ProductsHelper

  def can_edit_product(product)
    if current_user && current_user.products.include?(product)
       link_to "edit", edit_product_path(product),style:"color:orange"
    end
  end

  def badge_color(product)
     if product.condition.present?
      condition = product.condition
      if condition == 'New'
        content_tag(:span,condition,class:"badge badge-primary", style:"width:100px")
      elsif condition == 'Excellent'
        content_tag(:span,condition,class:"badge badge-success", style:"width:100px")
      elsif condition == 'Mint'
        content_tag(:span,condition,class:"badge badge-secondary", style:"width:100px")
      elsif condition == 'Used'
        content_tag(:span,condition,class:"badge badge-warning", style:"width:100px")
      else
        content_tag(:span,condition,class:"badge badge-danger", style:"width:100px")
      end
    end
  end

end
