class CreateTablePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :pname
      t.binary :picture
    end
  end
end
