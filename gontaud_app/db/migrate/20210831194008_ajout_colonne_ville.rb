class AjoutColonneVille < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ville, :string
  end
end
