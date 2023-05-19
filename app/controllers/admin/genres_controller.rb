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
      render :index
    end
  end

  def edit
    @genres = ItemGenre.find(params[:id])
  end

  def update
    @genres = ItemGenre.find(params[:id])
    if @genres.update(genre_params)
      redirect_to admin_genres_path
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def genre_params
  params.require(:item_genre).permit(:genre)
  end

end
