class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      flash[:notice] = "配送先を登録しました"
       redirect_to shipping_addresses_path
    else
      flash[:alert] = "追加に失敗しました"
      @shipping_address = ShippingAddress.new
      @shipping_addresses = ShippingAddress.all
      render :index
    end
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      flash[:notice] = "配送先を編集しました"
      redirect_to shipping_addresses_path
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    redirect_to shipping_addresses_path
  end

   private

  def shipping_address_params
    params.require(:shipping_address).permit(:customer_id, :ships_address, :ships_post_number, :ships_name)
  end


end
