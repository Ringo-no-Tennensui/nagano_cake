class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    cart_items = current_customer.cart_items
    if cart_items.present?
      @order = Order.new
      @shipping_addresses = ShippingAddress.all
    else
      flash[:notice] = "・カートが空です"
      redirect_to request.referer
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
   if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id =  @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.count = cart_item.count
        @order_item.order_price = (cart_item.item.price*1.1).floor
        @order_item.work_status = 0
        @order_item.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_completed_path
   else
     @cart_items = current_customer.cart_items
     render :confirm
   end
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.delivery_post_code = current_customer.post_code
      @order.delivery_address = current_customer.address
      @order.delivery_address_label = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.delivery_post_code = @shipping_address.post_code
      @order.delivery_address = @shipping_address.address
      @order.delivery_address_label = @shipping_address.address_label
    elsif params[:order][:select_address] == "2"
      @order.delivery_post_code = params[:order][:post_code]
      @order.delivery_address = params[:order][:address]
      @order.delivery_address_label = params[:order][:address_label]
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items

   if @order.delivery_post_code && @order.delivery_address && @order.delivery_address_label && @order.pay_option
     if @order.delivery_post_code =~ /\A[0-9]{7}\z/
       render :confirm
     else 
       flash[:notice] = "・郵便番号が正しくありません"
       redirect_to request.referer
     end
   else
     flash[:notice] = "・未入力の項目があります"
     redirect_to request.referer
   end
   
  end

  def completed
  end

  def index
    @orders=current_customer.orders.all.page(params[:page]).per(10)

  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :total_price, :pay_option, :delivery_post_code, :delivery_address, :delivery_address_label, :order_status)
  end
end
