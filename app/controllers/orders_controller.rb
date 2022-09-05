class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    # @order_address.save
  end

  private
  def order_address_params
    params.permit(:post_code, :sender_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end