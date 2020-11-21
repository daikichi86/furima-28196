class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
    def order_params
      params.require(:order).permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number)
    end
end
