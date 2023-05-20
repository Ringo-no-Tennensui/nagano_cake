class Public::CartsController < ApplicationController
  def index
    @carts = current_customer.carts
    # カート内の合計金額 @total
    @total = @carts.inject(0) { |sum, cart| sum + cart.subtotal }
  end

  def create

  @cart = Cart.new(cart_params)
  if current_customer.carts.find_by(item_id: @cart.item_id)
     cart = current_customer.carts.find_by(item_id: @cart.item_id)
     cart.count += @cart.count.to_i
     cart.save
   redirect_to carts_path
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