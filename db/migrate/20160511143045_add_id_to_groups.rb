class AddIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :id, :integer
    add_index :groups, :id
  end
end
