class Cuisine < ApplicationRecord

  validates :cuisine_name, presence: true
  validates :introduction, presence: true
  validates :time, presence: true

  belongs_to :customer
  has_many :cuisine_comments, dependent: :destroy
  has_many :cuisine_favorites, dependent: :destroy
end
