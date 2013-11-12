class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to products_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  def show
    @profile = User.find(params[:id])
  end
end

def create
  #   @review = @product.reviews.build(params[:review])
  #   @review.user_id = current_user.id
  @review = Review.new(
      :comment => params[:review][:comment],
      :product_id => @product.id,
      :user_id => current_user.id
      )
    if @review.save
      redirect_to products_path, notice: 'Review created successfully'
    else
      render :action => :show
    end
  end


