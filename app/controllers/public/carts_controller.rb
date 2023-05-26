class Public::CartsController < ApplicationController
  def index
    @carts = current_customer.carts
    # sumの初期値を0にしてから小計を加算
    @total = @carts.inject(0) { |sum, cart| sum + cart.subtotal }
  end

  def create
    @cart = Cart.new(cart_params)
    # カートに商品を追加するときに、元々同じ商品が入っていた場合
    if current_customer.carts.find_by(item_id: @cart.item_id)
      cart = current_customer.carts.find_by(item_id: @cart.item_id)
      # 数量を加算
      cart.count += @cart.count.to_i
      cart.save
      redirect_to carts_path
    # 同じ商品がない場合、そのまま保存
    else
      @cart.save
      redirect_to carts_path
    end
  end


  def update
    @cart= Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to carts_path
  end


  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

  def destroy_all
    current_customer.carts.destroy_all
    redirect_to carts_path
  end


  private

  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :count)
  end


end
