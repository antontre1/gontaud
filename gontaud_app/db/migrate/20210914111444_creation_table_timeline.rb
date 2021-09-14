class CreationTableTimeline < ActiveRecord::Migration[6.1]
  def change
    create_table :periodes do |t|
      t.belongs_to :user
      t.string :visitor
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
