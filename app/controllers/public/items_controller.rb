class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:items]).per(8)
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price, :sales_status)
  end
end
