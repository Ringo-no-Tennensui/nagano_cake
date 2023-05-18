class Public::CartItemsController < ApplicationController
  def index
  end
  
  def create
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
