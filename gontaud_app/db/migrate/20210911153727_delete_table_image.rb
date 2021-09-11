class DeleteTableImage < ActiveRecord::Migration[6.1]
  def change
    drop_table :images_old
  end
end
