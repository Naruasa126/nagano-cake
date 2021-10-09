class Admin::OrderDetailController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)
    @order = @order_detail.order
    @order_details = @order.order_details
    if @order_details.any? {|order_detail| order_detail.production? }
       @order.production!
    elsif  @order_details.all? {|order_detail| order_detail.complete? }
       @order.prepar_wait!
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:item_id,:customer_id,:price,:amount,:making_status)
  end
end
