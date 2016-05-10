class AddingForeignKeys < ActiveRecord::Migration
  def up
	execute 'ALTER TABLE add_projects
  ADD CONSTRAINT admin_fkey FOREIGN KEY (admin)
      REFERENCES user_details (username) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;'
	
	rename_column :groups, :user, :user_name
	rename_column :groups, :group, :groupname
	rename_column :my_groups, :group, :groupname
  end
end
