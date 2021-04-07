class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :name, presence: true
        validates :k_name, presence: true
        validates :nickname, presence: true
        validates :email, presence: true

        has_many :cuisines, dependent: :destroy
        has_many :cuisine_comments, dependent: :destroy
        has_many :cuisine_favorites, dependent: :destroy
end
