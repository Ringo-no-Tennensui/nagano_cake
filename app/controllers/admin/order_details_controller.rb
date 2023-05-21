class Admin::OrderDetailsController < ApplicationController

  # def update
  # @order_detail = OrderDetail.find(params[:id])
  # @order = @order_detail.order
  # @order_detail.update(order_item_params)
  #   if @order_item.task_status == "making"
  #     @order.update(status: 2)
  #   elsif @order.order_detail.quantity == @order.order_detail.where(order_status: "complete").count
  #     @order.update(status: 3)
  #   end
  # redirect_to adimin_order_path(@order)
  # end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_detail_params)
      if @order.task_status == "making"
          @order_details.update_all(order_status: 2)
      elsif @order.order_detail.quantity == @order.order_detail.where(order_status: "complete").count
          @order_details.update(order_status: 3)
      end
       redirect_to admin_order_path(@order), notice: "注文ステータスを変更しました"
    else
      render 'show'
    end
  end

  private

  def order_detail_params
  params.require(:order_detail).permit(:task_status)
  end

end
