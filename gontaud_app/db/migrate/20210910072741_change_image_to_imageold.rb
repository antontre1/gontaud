class ChangeImageToImageold < ActiveRecord::Migration[6.1]
  def change
    rename_table :images, :images_old
  end
end
