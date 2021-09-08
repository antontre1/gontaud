class AddDatetimeToPhotos < ActiveRecord::Migration[6.1]
  def change
    change_table :photos do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
