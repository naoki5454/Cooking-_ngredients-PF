class HomesController < ApplicationController

  def top
    @cuisines = Cuisine.limit(4).order(" created_at DESC ")
  end

  def about
  end

end
