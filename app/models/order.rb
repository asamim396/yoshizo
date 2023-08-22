class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
 
 enum payment_option: { credit_card: 0, transfer: 1 }
 
 def address_display
    '〒' + post_code + '　宛先' + address + '　宛名' + name
 end
 
end
