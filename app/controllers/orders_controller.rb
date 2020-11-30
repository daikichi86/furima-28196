class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.record.present?
    
    @order = Recordstreet.new
  end

  def create
    @order = Recordstreet.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
    def order_params
      params.require(:recordstreet).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id], price: @item.price)
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
    end

    def item_find
      @item = Item.find(params[:item_id])
    end
end
