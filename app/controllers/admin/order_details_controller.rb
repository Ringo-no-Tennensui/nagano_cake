class Admin::OrderDetailsController < ApplicationController

  def update
  @order_detail = OrderDetil.find(params[:id])
  @order = @order_detail.order
  @order_detail.update(oder_item_params)
    if @order_item.task_status == "making"
      @order.update(status: 2)
    elsif @order.order_detail.quantity == @order.order_detail.where(order_status: "complete").count
      @order.update(status: 3)
    end
  redirect_to adimin_order_path(@order)
  end

  private

  def order_detail_params
  params.require(:order_detail).permit(:task_status)
  end

end
