class AddTableImage < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.text :image
      t.text :caption
    end
  end
end
