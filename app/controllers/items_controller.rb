class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
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
    @item = Item.find_by(id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :text, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to action: :index unless user_signed_in?
  end
end
