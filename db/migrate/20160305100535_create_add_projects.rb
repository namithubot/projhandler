class CreateAddProjects < ActiveRecord::Migration
  def change
    create_table :add_projects do |t|
      t.string :admin, foreign_key = true
      t.string :title
      t.boolean :group
      t.string :group_name
      t.date :deadline
      t.boolean :public
      t.text :link
      t.text :info

      t.timestamps null: false
    end
  end
end
