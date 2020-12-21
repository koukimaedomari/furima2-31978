class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :image, :category_id, :status_id, :postage_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end


end
