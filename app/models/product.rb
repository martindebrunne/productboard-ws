class Product < ApplicationRecord
  has_many :workers, dependent: :destroy
  has_many :users, through: :workers
  has_many :cards, dependent: :destroy

  validates :name, presence: true, allow_blank: false
end
