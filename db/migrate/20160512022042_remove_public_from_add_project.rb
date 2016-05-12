class RemovePublicFromAddProject < ActiveRecord::Migration
  def change
   remove_column :add_projects, :public
  end
end
