class Admin::GenresController < ApplicationController

  def index
    @genres = ItemGenre.new
    @genres = ItemGenre.all
  end

  def create
  @genres = ItemGenre.new(genre_params)
    if @genres.save
      # create機能を発火させた元の画面にもどす
      redirect_to request.referer
    else
      @genres = ItemGenre.all
      rener :index
    end
  end

  def edit
  end

  def update
  end

  private

  def genre_params
  params.require(:item_genre).permit(:genre)
  end

end
