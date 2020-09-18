class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]
    
  def index
  end

  def new
  end

  private

  def move_to_new
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
