class RemoveTrueFromAddProjects < ActiveRecord::Migration
  def change
	remove_column :add_projects, :true, :string
  end
end
