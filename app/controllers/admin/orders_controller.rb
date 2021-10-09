class Admin::OrdersController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status].to_i
    @order.update(orders_params)
    if @order.pay_complete?
      @order.order_details.map{|order_detail| order_detail.wait_production! }

    end
    
    redirect_to admin_order_path(@order.id)
  end

  private

  def orders_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status,:created_at,:updated_at)
  end
end
