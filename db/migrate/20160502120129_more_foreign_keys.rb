class MoreForeignKeys < ActiveRecord::Migration
  def change
	execute 'ALTER TABLE my_groups ADD CONSTRAINT unique_group_name 
UNIQUE (groupname);'

	execute 'ALTER TABLE add_projects
  ADD CONSTRAINT project_group_fkey FOREIGN KEY (group_name)
      REFERENCES my_groups (groupname) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;'

	execute 'ALTER TABLE groups
  ADD CONSTRAINT group_to_my_group_fkey FOREIGN KEY (groupname)
      REFERENCES my_groups (groupname) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;'

	execute 'ALTER TABLE groups
  ADD CONSTRAINT group_user_fkey FOREIGN KEY (user_name)
      REFERENCES user_details (username) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;'

      execute 'ALTER TABLE my_groups
  ADD CONSTRAINT my_group_admin_fkey FOREIGN KEY (admin)
      REFERENCES user_details (username) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;'
 
     remove_column :user_details, :id
  end
end
