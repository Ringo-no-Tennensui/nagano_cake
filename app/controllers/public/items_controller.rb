class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(8)
    @genres = ItemGenre.all  
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = ItemGenre.all
    @cart_items = CartItem.new()
  end
end


