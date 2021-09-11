class SuppressWrongcolumnsCreatestringInPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :image, :string
    remove_column :photos, :picture, :binary
  end
end
