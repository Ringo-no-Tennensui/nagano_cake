class Public::ItemsController < ApplicationController

  def index
    @item = Item.all
    # @item = Item.where(sales_status: "sale")
    @items = @item.page(params[:page]).per(8)
    @genres = ItemGenre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = ItemGenre.all
    @cart = Cart.new
  end
end


