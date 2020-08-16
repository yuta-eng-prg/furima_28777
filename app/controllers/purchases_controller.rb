class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(user_id: purchase_params[:user_id], item_id: purchase_params[:item_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def purchase_params
    params.permit(:user_id, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    item = Item.find(purchase_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end
