class Public::CartsController < ApplicationController
  def index
    @carts = Cart.all
    # カート内の合計金額 @total
    @total = @carts.inject(0) { |sum, cart| sum + cart.subtotal }
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
    redirect_to items_path
  end

  def update
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

  def destroy_all
    cart = Cart.all
    cart.destroy
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :count)
  end


end
