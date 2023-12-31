class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def with_tax_price
    (item.price * 1.1).floor
  end
  
  def subtotal_price
    item.with_tax_price * quantity
  end
  
end
