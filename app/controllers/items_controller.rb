class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description_of_item, :product_category_id, :product_status_id,
                                 :shipping_charge_id, :shipping_area_id, :day_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end
end
