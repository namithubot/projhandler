class CreateMyGroups < ActiveRecord::Migration
  def change
    create_table :my_groups do |t|
      t.string :group
      t.string :admin

      t.timestamps null: false
    end
  end
end
