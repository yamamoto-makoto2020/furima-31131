class ItemsController < ApplicationController
  before_action :authenticate_user!, :except => :index
  def index
    # @items = Item.all
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
    params.require(:item).permit(:title, :image, :price, :explanation, :area_id, :category_id, :delivery_free_id, :guideline_id, :status_id).merge(user_id: current_user.id)
  end
end
