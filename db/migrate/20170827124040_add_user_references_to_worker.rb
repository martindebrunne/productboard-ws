class AddUserReferencesToWorker < ActiveRecord::Migration[5.0]
  def change
    add_reference :workers, :user, foreign_key: true
  end
end
