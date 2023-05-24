class Admin::CustomersController < ApplicationController

  def index
    #会員者情報　１ページの表示件数:10件
    @customers = Customer.all.page(params[:page]).per(10) 
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
    flash[:notice] = "編集に成功しました"
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :email , :phone_number, :member_status)
  end

end
