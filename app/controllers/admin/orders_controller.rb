class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
  @order = Order.find(params[:id])
  @order_details = @order.order_details
    if@order.update(order_params)
      if @order.stutas == "check"
      @order_details.update_all(task_status: 1)
      end
    flash[:notice] = "注文ステータスを変更しました"
    redirect_to admin_order_path(@order)
    end
  end
end
