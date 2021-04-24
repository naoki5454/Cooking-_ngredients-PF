class Cuisine < ApplicationRecord
  validates :cuisine_name, presence: true
  validates :material_introduction, presence: true
  validates :introduction, presence: true
  validates :time, presence: true

  attachment :cuisine_image
  belongs_to :customer
  belongs_to :genre
  has_many :cuisine_comments, dependent: :destroy
  has_many :cuisine_favorites, dependent: :destroy

  # いいねがついているかの判断
  def favorited_by?(customer)
    cuisine_favorites.where(customer_id: customer.id).exists?
  end

  # 部分一致検索のため
  def self.search(_search, word)
    Cuisine.where(['cuisine_name LIKE ?', "%#{word}%"])
  end
end
