class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customers_params)
    redirect_to public_customers_my_page_path(current_customer.id)
  end



  private

  def customers_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,:postal_code, :address, :telephone_number, :email, :is_valid)
  end
end
