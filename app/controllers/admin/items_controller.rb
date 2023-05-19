class Admin::ItemsController < ApplicationController

  def index
  @items = Item.page(params[:page])
  end

  def new
  @item = Item.new
  end

  def create
  @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
      flash[:notice] = "#{@item.item_name}を追加しました"
    else
      flash[:alert] = "追加に失敗しました"
      @item = Item.new(item_params)
      redirect_to new_admin_item_path
    end
  end

  def show
  @item = Item.find(params[:id])
  end

  def update
  @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "#{@item.name}を編集しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:alert] = "編集に失敗しました"
      redirect_to edit_admin_item_path(@item)
    end
  end

  private

  def item_params
  params.require(:item).permit(:item_name, :image, :item_explanation, :item_price, :sales_status, :item_genre_id)
  end

end
