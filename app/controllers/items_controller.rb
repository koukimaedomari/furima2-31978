class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :items, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    if @item.user == current_user
      render :edit
    else @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    
    if @item.update(item_params)
      redirect_to  item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    elsif @item.user != current_user
      redirect_to root_path
    end
  end
  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :image, :category_id, :status_id, :postage_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def items
    @item = Item.find(params[:id])
  end


end
