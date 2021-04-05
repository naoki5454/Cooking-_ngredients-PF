class CuisineComment < ApplicationRecord
    belongs_to :customer
    belongs_to :cuisine
end
