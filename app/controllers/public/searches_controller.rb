class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Item"
      @items = Item.looks(params[:search], params[:item_name])
    else
      @genres = Genre.looks(params[:search], params[:word])
    end
    render "/layout/search_result"
  end
end
