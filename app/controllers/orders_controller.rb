class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(order_address_params)
    binding.pry
    if @order_address.valid?
      pay_product
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
                                          :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_address_params[:token],
      currency:'jpy'
    )
  end
end