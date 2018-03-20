class CreateUserPrrojects < ActiveRecord::Migration
  def change
    create_table :user_prrojects do |t|
      t.belongs_to :prroject, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
