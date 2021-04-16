class Cuisine < ApplicationRecord

  validates :cuisine_name, presence: true
  validates :material_introduction, presence: true
  validates :introduction, presence: true
  validates :time, presence: true

  belongs_to :customer
  belongs_to :genre
  has_many :cuisine_comments, dependent: :destroy
  has_many :cuisine_favorites, dependent: :destroy

  def favorited_by?(customer)
    cuisine_favorites.where(customer_id: customer.id).exists?
  end

  def self.search(search,word)
    Cuisine.where(['cuisine_name LIKE ?', "%#{word}%"])
  end
end
