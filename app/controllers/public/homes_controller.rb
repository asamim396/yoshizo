class Public::HomesController < ApplicationController
  def top
     @items = Item.where(is_active: true).order(updated_at: :desc,reated_at: :desc)
  end

  def about

  end
end
