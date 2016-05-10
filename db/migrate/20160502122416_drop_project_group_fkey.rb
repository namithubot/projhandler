class DropProjectGroupFkey < ActiveRecord::Migration
  def change
 	execute 'ALTER TABLE add_projects DROP CONSTRAINT 
project_group_fkey;'
  end
end
