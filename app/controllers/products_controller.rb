class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, only: :edit

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to product_path(product.id)
    else
      @product = Product.find(params[:id])
      render :edit
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :product_status_id, :delivery_fee_id,
                                    :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
  
  def move_to_index
    @product = Product.find(params[:id])
    unless current_user.id == @product.user_id
      redirect_to action: :show
    end
  end
end
