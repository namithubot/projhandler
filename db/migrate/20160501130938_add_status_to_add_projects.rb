class AddStatusToAddProjects < ActiveRecord::Migration
  def change
    add_column :add_projects, :status, :string
    remove_column :add_projects, :group, :boolean
  end
end
