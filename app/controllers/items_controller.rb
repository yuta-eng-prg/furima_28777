class ItemsController < ApplicationController
  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :category_id,
      :status_id,
      :shipping_fee_burden_id,
      :shipping_region_id,
      :days_until_shipping_id,
      :price,
      :user_id
    ).merge(user_id: current_user.id)
  end

end
