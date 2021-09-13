class AddColumnstophotos < ActiveRecord::Migration[6.1]
  def change
    change_table :photos do |t|
      t.string :batiment
      t.string :piece
      t.string :typephoto
    end
  end
end
