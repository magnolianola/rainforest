class ReviewsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]
  before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user
    respond_to do |format|
    	if @review.save
    		format.html { redirect_to products_path, notice: 'Review created successfully' }
        format.js {}
    	else
    		format.html { render :action => :show }
        format.js {}
      end
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
    redirect_to product_path
  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end


  def review_params
    params.require(:review).permit(:comment)
  end
end
