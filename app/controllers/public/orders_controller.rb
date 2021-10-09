class Public::OrdersController < ApplicationController
  def new
    @cart_items = CartItem.all
    if @cart_items == []
     redirect_to  public_cart_items_path
    else
     @order = Order.new
    end
  end

  def confirm
    @order = Order.new(orders_params)
    @cart_items = CartItem.all
    @order.shipping_cost = 800
    if params[:order][:customer_address] == "0"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif   params[:order][:customer_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif   params[:order][:customer_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def complete

  end

  def index
    @orders = Order.all.page(params[:order]).per(8)
  end

  def show
     @order = Order.find(params[:id])

  end

  def create
    @order = Order.new(orders_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new(
        item_id: cart_item.item_id,
        order_id: @order.id,
        price: cart_item.item.price,
        amount: cart_item.amount,
      )
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to  public_orders_complete_path
  end

  private

  def orders_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end
end
