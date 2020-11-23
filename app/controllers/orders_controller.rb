class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Recordstreet.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
    def order_params
      params.permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id)
    end
end
