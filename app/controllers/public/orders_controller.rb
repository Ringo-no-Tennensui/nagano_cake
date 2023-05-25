class Public::OrdersController < ApplicationController
  def new
    @carts = current_customer.carts
    # カートの中に商品が入っている場合
    if @carts.any?
      @order = Order.new
      @shipping_addresses = current_customer.shipping_addresses.all
    # カートの中に商品がない場合オーダーには進めない
    else
    #今現在のページ
    redirect_to carts_path
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # カートの情報をオーダーディティールに複製
      current_customer.carts.each do |cart|
        order_detail = OrderDetail.new()
        order_detail.order_id = @order.id
        order_detail.item_id = cart.item_id
        order_detail.quantity = cart.count
        order_detail.item_price = cart.item.tax_price
        order_detail.save
      end
      # カートの中身を削除
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
      # 配送先住所を登録していないのであれば１のラジオボタンを押しても先には進めない
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
      # 郵便番号（ハイフンなし7桁）、配送先住所、配送先氏名が入力されてたらture
      unless @order.ships_post_number =~ /\A[0-9]{7}\z/ && !@order.ships_address.empty? && !@order.ships_name.empty?
       flash[:notice] = "・郵便番号が正しくありません、または未入力の項目があります"
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
    # sumの初期値を0にしてから小計を加算
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_price }
  end

 private
    def order_params
        params.require(:order).permit(:customer_id, :ships_address, :ships_post_number, :ships_name, :payment, :shipping_cost, :pay_price, :order_status)
    end
end