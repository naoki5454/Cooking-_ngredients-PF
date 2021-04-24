class HomesController < ApplicationController
  def top
    @cuisines = Cuisine.limit(4).order(Arel.sql('created_at DESC'))
  end

  def about; end
end
