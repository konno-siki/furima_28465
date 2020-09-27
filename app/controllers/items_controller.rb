class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :ensure_correct_user

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

  def edit
    @item = Item.find_by(id: params[:id])
    redirect_to action: :show if current_user.id != @item.user.id
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render('items/edit')
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :text, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  # def set_current_user
  #   @current_user = User.find_by(id: session[:user_id])
  # end

  # def ensure_correct_user

  # end
end
