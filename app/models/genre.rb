class Genre < ApplicationRecord
  validates :genre_name, presence: true

  has_many :cuisines

  # 部分一致検索のため
  def self.search(_search, word)
    @genres = Genre.where('genre_name LIKE?', "%#{word}%")
  end
end
