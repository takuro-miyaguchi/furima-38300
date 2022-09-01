class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
    # @items = Item.find(params[:id])
  # end

  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :condition_id, :charge_id, :sender_id, :period_id, :price).merge(user_id: current_user.id)
  end

end