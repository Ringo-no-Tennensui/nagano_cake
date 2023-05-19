class Public::CartsController < ApplicationController
  def index
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
    redirect_to items_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_params
    params.require(:cart).permit(:customer_id, :item_id, :count)
  end


end
