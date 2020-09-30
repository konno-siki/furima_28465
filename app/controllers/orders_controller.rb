class OrdersController < ApplicationController
  before_action :get_item

  def index
  end

  def create
    @order = Order.new(user_id: current_user.id, item_id: params[:item_id])
    if @order.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :user_id, :item_id)
  end

  def pay_item
    Payjp.api_key = "sk_test_201a0e72981168993ec370d8" # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency:'jpy' # 通貨の種類（日本円）
    )
  end

  def get_item
    @item = Item.find_by(id: params[:item_id])
  end
end
