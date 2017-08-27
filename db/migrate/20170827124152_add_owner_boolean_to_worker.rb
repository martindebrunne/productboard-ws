class AddOwnerBooleanToWorker < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :owner, :boolean, default: false
  end
end
