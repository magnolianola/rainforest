class ProductsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]

  def index

    @products = Product.order('products.created_at DESC').page(params[:page])

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      # @review = @product.reviews.build
      @review = Review.new( :product_id => @product.id )
    end

  	respond_to do |format|
  		format.html # show.html.erb
  		format.json { render json: @product }
    end
  end

  def new
  	@product = Product.new

  	respond_to do |format|
  		format.html # new.html.erb
  		format.json { render json: @product }
    end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to product_path(@product)
  	else
  		render :new
  	end
  end

  def update
  	@product = Product.find(params[:id])

  respond_to do |format|
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render :edit
 	   end
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy 
  	
  	respond_to do |format|
  		format.html {redirect_to products_url}
  		format.json {head :no_content}
  	end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end