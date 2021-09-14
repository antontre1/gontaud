class AjoutColCommentsToPeriode < ActiveRecord::Migration[6.1]
  def change
        add_column :periodes, :comments, :string
  end
end
