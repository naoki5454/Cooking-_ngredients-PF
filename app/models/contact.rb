class Contact < ApplicationRecord

  validates :name, presence: true
  validates :message, presence: true

  belongs_to :customer
end
