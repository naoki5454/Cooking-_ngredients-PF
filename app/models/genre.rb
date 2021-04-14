class Genre < ApplicationRecord

  has_many :cuisines

  #部分一致検索のため
  def self.search(search, word)
    @genres = Genre.where("name LIKE?","%#{word}%")
  end

end
