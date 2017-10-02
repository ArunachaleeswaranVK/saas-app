class CreatePrrojects < ActiveRecord::Migration
  def change
    create_table :prrojects do |t|
      t.string :title
      t.string :details
      t.date :expected_completion_date
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
