class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all.page(params[:cart_items]).per(8)
  end

  def create
    @cart_items = CartItem.new(cart_items_params)
    @cart_items.save
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path(current_customer.id)
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to public_cart_items_path(current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to public_cart_items_path(current_customer.id)

  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
