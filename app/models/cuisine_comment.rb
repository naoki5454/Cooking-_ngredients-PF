class CuisineComment <

    validates :comment, presence: true

    belongs_to :customer
    belongs_to :cuisine
end
