class AddUserIdToTablePhotos < ActiveRecord::Migration[6.1]
  def change
    change_table :photos do |t|
      t.belongs_to :user
    end
  end
end
