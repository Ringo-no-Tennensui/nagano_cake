class Public::ItemsController < ApplicationController

  def index
    #@item = Item.find(params[:id])
    @items = Item.page(params[:page]).per(8)
    @item = Item.all
    @genres = ItemGenre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = ItemGenre.all
    @cart = Cart.new
  end
end


