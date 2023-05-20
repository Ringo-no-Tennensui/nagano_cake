class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # @customer = Order.customer.find(params[:id])
    @shipping_addresses = current_customer.shipping_addresses.all
  end

  def create
    @order = Order.new(order_params)
    @order.save
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
        ship = ShippingAddress.find(params[:order][:customer_id])
        @order.ships_post_number = ship.post_number
        @order.ships_address = ship.address
        @order.ships_name = ship.name

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
  end

  def thanks
  end

  def index
  end

  def show
  end


 private
    def order_params
        params.require(:order).permit(:customer_id, :ships_address, :ships_post_number, :ships_name, :payment, :shipping_cost, :pay_price, :order_status)
    end
end