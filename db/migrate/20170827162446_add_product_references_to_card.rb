class AddProductReferencesToCard < ActiveRecord::Migration[5.0]
  def change
    add_reference :cards, :product, foreign_key: true
  end
end
