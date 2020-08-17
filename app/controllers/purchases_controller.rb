class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_not_purchase

  def new
    @item = Item.find(params[:item_id])
    @purchase = PurchaseShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseShippingAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  def item_not_purchase
    @item = Item.find(params[:item_id])
    if Purchase.find_by(item_id: @item.id)
      redirect_to root_path
    elsif @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_shipping_address).permit(
      :user_id,
      :item_id,
      :token,
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end
