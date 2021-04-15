class Public::CuisineFavoritesController < ApplicationController

  def create
    @cuisine = Cuisine.find(params[:cuisine_id])
    #連打して何回も押せないように
    unless @cuisine.favorited_by?(current_customer)
      favorite = @cuisine.cuisine_favorites.new(customer_id: current_customer.id)
      favorite.save
      redirect_to request.referer
    end
  end

  def destroy
    @cuisine = Cuisine.find(params[:cuisine_id])
    favorite = @cuisine.cuisine_favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
    redirect_to request.referer
  end

end
