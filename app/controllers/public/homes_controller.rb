class Public::HomesController < ApplicationController

  def top
    @items = Item.all.page(params[:items]).per(4)
  end

  def about
  end
end
