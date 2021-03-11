class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(:postal_number, :prefecture_id, :city, :house_number,
                                          :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end