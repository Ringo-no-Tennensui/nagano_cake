class SearchsController < ApplicationController
  
  def search
    @genres = ItemGenre.all
    @word = params[:word]
    if admin_signed_in?
    @customers = Customer.looks(params[:search], @word)
    else
    @items = Item.looks(params[:search], @word)
    end
  end
  
end
