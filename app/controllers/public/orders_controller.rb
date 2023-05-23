class Public::OrdersController < ApplicationController
  def new
    @carts = current_customer.carts
    if @carts.any?
      @order = Order.new
      @shipping_addresses = current_customer.shipping_addresses.all
    else
    redirect_to carts_path #今現在のページ
    end
  end

  def create
     @order = Order.new(order_params)
    if @order.save
      current_customer.carts.each do |cart|
        order_detail = OrderDetail.new()
        order_detail.order_id = @order.id
        order_detail.item_id = cart.item_id
        order_detail.quantity = cart.count
        order_detail.item_price = cart.item.tax_price
        order_detail.save
     end
     current_customer.carts.destroy_all
     redirect_to thanks_orders_path
    end

  end

  def confirm
    # @orderはでかい箱で、その中に小さい箱を指定するためにストロングパラメーターを指定している。
    @order = Order.new(order_params)


        # if文を記述して、hidden fieldが作動するようにする。
        # ご自身の住所と配送先住所が選択された場合はhiddenで処理

        # 現在memberに登録されている住所であれば
      if params[:order][:address_option] == "0"
        @order.ships_post_number = current_customer.post_code
        @order.ships_address = current_customer.address
        @order.ships_name = current_customer.last_name + current_customer.first_name

        # collection.selectであれば
      elsif params[:order][:address_option] == "1"
        ship = ShippingAddress.find_by(params[:order][:customer_id])
        if current_customer.shipping_addresses.exists?
        @order.ships_post_number = ship.ships_post_number
        @order.ships_address = ship.ships_address
        @order.ships_name = ship.ships_name
        end

        # 新規住所入力であれば
      elsif params[:order][:address_option] == "2"
        @order.ships_post_number = params[:order][:ships_post_number]
        @order.ships_address = params[:order][:ships_address]
        @order.ships_name = params[:order][:ships_name]
      else
            render 'new'
      end

        @carts = current_customer.carts.all
        @order.customer_id = current_customer.id

    if @order.ships_post_number && @order.ships_address && @order.ships_name && @order.payment
      if @order.ships_post_number =~ /\A[0-9]{7}\z/
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

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_price }
  end

 private
    def order_params
        params.require(:order).permit(:customer_id, :ships_address, :ships_post_number, :ships_name, :payment, :shipping_cost, :pay_price, :order_status)
    end
end