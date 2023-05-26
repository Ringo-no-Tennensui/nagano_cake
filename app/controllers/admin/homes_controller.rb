class Admin::HomesController < ApplicationController

  def top
    #注文履歴 １ページの表示数:20件
    @orders = Order.all.page(params[:page]).per(20) 
  end
end
