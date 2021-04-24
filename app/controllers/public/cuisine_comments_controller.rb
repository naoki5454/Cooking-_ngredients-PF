class Public::CuisineCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cuisine = Cuisine.find(params[:cuisine_id])
    @comment = current_customer.cuisine_comments.new(cuisine_comments_params)
    @comment.cuisine_id = @cuisine.id
    @comment.customer_id = current_customer.id
    return if @comment.save

    # redirect_to cuisine_path(cuisine)
    render 'errors'
  end

  def destroy
    @cuisine = Cuisine.find(params[:cuisine_id])
    @comment = CuisineComment.find(params[:id])
    @comment.destroy
  end

  private

  def cuisine_comments_params
    params.require(:cuisine_comment).permit(:comment)
  end
end
