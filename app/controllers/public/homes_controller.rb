class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = ItemGenre.all
  end

  def about
  end
end
