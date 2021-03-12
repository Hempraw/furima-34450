class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
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
  def set_product
    @product = Product.find(params[:product_id])
  end

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

  def move_to_index
    if current_user.id == @product.user_id
    redirect_to root_path
    end
  end
end