class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
