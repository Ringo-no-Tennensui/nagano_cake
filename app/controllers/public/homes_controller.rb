class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = ItemGenre.all
  end

  def index
    # urlにgenre_idがある場合
    if params[:id]
    @genres = ItemGenre.all
    @genre = ItemGenre.find(params[:id])
    @items = @genre.items.where(params[:id])
    else
    @items = Item.all
    @genres = ItemGenre.all
    render :top
    end
  end

  def about
  end
end
