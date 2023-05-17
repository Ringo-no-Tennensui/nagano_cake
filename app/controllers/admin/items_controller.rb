class Admin::ItemsController < ApplicationController

  def index
  @items = Item.page(params[:page])
  end

  def new
  @items = Item.new
  end

  def create
  @items = Item.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.name}を追加しました"
      redirect_to admin_item_path(@item)
    else
      flash[:alert] = "ジャンル名を入力してください"
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
      flash[:alert] = "ジャンル名を入力してください"
      redirect_to edit_admin_item_path(@item)
    end
  end

  private

  def item_params
  params.require(:item).permit(:item_name, :image, :item_explanation, :item_price, :sales_status, :genre_id)
  end

end
