class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :content
      t.string :col_name
      t.integer :position

      t.timestamps
    end
  end
end
