class User < ApplicationRecord
  has_many :workers
  has_many :products, through: :workers
end
