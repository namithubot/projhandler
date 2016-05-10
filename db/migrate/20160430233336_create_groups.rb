class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :user
      t.string :group

      t.timestamps null: false
    end
  end
end
