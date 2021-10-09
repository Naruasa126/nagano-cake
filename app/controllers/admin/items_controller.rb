class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:items]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(items_params)
    @items.save
    redirect_to admin_item_path(@items.id)
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price, :sales_status)
  end
end
