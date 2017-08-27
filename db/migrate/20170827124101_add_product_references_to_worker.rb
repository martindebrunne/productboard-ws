class AddProductReferencesToWorker < ActiveRecord::Migration[5.0]
  def change
    add_reference :workers, :product, foreign_key: true
  end
end
