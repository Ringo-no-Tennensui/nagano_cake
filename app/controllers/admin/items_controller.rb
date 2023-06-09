class Admin::ItemsController < ApplicationController

  def index
    #ページネーションの設定
    @items = Item.page(params[:page]) 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      #追加したアイテムの詳細ページ
      redirect_to admin_item_path(@item) 
      #追加したアイテム名を表示
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      #編集したアイテム名を表示
      flash[:notice] = "#{@item.item_name}を編集しました" 
      #編集したアイテムの詳細画面に飛ぶ
      redirect_to admin_item_path(@item)
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_explanation, :item_price, :sales_status, :item_genre_id)
  end

end
