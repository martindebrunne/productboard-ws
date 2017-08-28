class Card < ApplicationRecord
  belongs_to :product

  validates :content, presence: true, allow_blank: false
  validates :position, presence: true, allow_blank: false
  validates :col_name, presence: true, allow_blank: false
end
