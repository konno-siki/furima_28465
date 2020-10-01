class OrdersController < ApplicationController
  before_action :get_item
  before_action :move_to_signin, only: :index
  before_action :forbid_items_user, only: :index
  before_action :purchased_items_page, only: :index

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save # order_addressのsaveメソッド
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency:'jpy' # 通貨の種類（日本円）
    )
  end

  def get_item
    @item = Item.find_by(id: params[:item_id])
  end

  def move_to_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def forbid_items_user
    @item = Item.find_by(id: params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def purchased_items_page
    @order = Order.find_by(item_id: params[:item_id])
    if @order != nil
      redirect_to root_path
    end
  end
end
