class Admin::OrderDetailsController < ApplicationController

def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  #誤ったデータをデーターベースへ書き込まないための処理を行う
  OrderDetail.transaction do
    @order_detail.update(order_detail_params)
    #制作ステータスが作成中の時
    if @order_detail.task_status == "making"
      #注文ステータスが作成中に変更される
      @order.update(order_status: 2)
      #注文詳細の商品種数 = 注文種数の全ての制作ステータス数が制作完了になったら
    elsif @order.order_details.count == @order.order_details.where(task_status: "complete").count
      #注文ステータスが発送準備中に変更になる
       @order.update(order_status: 3)
    end
  end
      flash[:notice] = "制作ステータスを変更しました"
      redirect_to admin_order_path(@order)
  #ステータスの変更ができなかった際の処理(例外発生時)
  rescue => e 
    flash[:alert] = "ステータスの変更に失敗しました"
    redirect_to admin_order_path(@order)
  end


  private
    def order_detail_params
      params.require(:order_detail).permit(:task_status)
    end
  end