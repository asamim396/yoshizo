class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :tags

  validates :name, presence:true
  validates :explanation, presence:true
  validates :price, presence:true, numericality: {greater_than_or_equal_to: 1}

  has_one_attached :item_image
  
  def with_tax_price
    (price * 1.1).floor
  end

end
