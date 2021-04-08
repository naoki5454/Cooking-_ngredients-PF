class Public::CuisineCommentsController < ApplicationController

  def create
    cuisine = Cuisine.find(params[:cuisine_id])
    comment = current_customer.cuisine_comments.new(cuisine_comments_params)
    comment.cuisine_id = cuisine.id
    comment.save
    redirect_to cuisine_path(cuisine)
  end

  private

  def cuisine_comments_params
    params.require(:cuisine_comment).permit(:comment)
  end

end
