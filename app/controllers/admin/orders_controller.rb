class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    #inject(0)でsumの初期値をを0にする。小計を加算していく
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_price } 
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    Order.transaction do 
     @order.update(order_params)
      #注文ステータスが入金確認の時
      if @order.order_status == "check"
        #制作ステータスが制作待ちになる
        @order_details.update(task_status: 1) 
      end
    end
      flash[:notice] = "注文ステータスを変更しました"
      redirect_to admin_order_path(@order)
    rescue => e
      flash[:alert] = "ステータスの変更に失敗しました"
      redirect_to admin_order_path(@order)
  end
  

  private
  
  def order_params
      params.require(:order).permit(:order_status)
  end


end
