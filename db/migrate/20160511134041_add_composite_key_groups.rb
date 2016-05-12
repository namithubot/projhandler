class AddCompositeKeyGroups < ActiveRecord::Migration
  def change
	execute 'ALTER TABLE groups DROP CONSTRAINT groups_pkey;'
	execute 'ALTER TABLE groups ADD PRIMARY KEY (user_name, groupname);'
	execute 'ALTER TABLE groups DROP COLUMN id;'
	
  end
end
