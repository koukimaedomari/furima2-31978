class OrdersController < ApplicationController
  before_action :orders, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    if @item.user == current_user || @item.user != current_user && @item.order.present?
      redirect_to root_path
    end
    @order = OrderCash.new
  end
  
  def create
    @order = OrderCash.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_cash).permit(:post_number, :area_id, :city, :address, :build_name, :telephone_number,:order_id, :item_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  
  def orders
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
 end

end

