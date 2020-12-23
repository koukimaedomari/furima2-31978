class OrdersController < ApplicationController
  before_action :items, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    # binding.pry
    @order = OrderCash.new
  end

  def create
    @order = OrderCash.new(order_params)
    if @order.valid?
      @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_cash).permit(:post_number, :area_id, :city, :address, :build_name, :telephone_number,:order_id, :item_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def items
    @item = Item.find(params[:item_id])
  end
  
end

# .require(:order_cash)