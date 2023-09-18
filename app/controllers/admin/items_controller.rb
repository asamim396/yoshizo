class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    tags = Vision.get_image_data(item_params[:item_image])
    if @item.save
      tags.each do |tag|
        @item.tags.create(name: tag)
      end
      redirect_to admin_item_path(@item)
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render "edit"
    end
  end
   private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :is_active, :item_image)
  end

end
