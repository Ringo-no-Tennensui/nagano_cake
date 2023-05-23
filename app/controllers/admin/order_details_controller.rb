class Admin::OrderDetailsController < ApplicationController

def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  OrderDetail.transaction do
    @order_detail.update(order_detail_params)
    if @order_detail.task_status == "making"
      @order.update(order_status: 2)
    elsif @order.order_details.count == @order.order_details.where(task_status: "complete").count
       @order.update(order_status: 3)
    end
  end
      flash[:notice] = "制作ステータスを変更しました"
      redirect_to admin_order_path(@order)
    rescue => e
    flash[:alert] = "ステータスの変更に失敗しました"
    redirect_to admin_order_path(@order)
  end


  private
    def order_detail_params
    params.require(:order_detail).permit(:task_status)
    end
  end