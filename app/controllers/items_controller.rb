class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    redirect_to root_path if current_user.id != @item.user_id
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if current_user.id != @item.user_id
    redirect_to root_path if @item.destroy
  end

  def set_item
    @item = Item.find(params[:id])
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
