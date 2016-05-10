class ChangeDataTypeForStatus < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE add_projects ALTER COLUMN status TYPE integer 
USING (status::integer)'
  end

  def down
    execute 'ALTER TABLE add_projects ALTER COLUMN status TYPE text 
USING 
(status::text)'
  end

  def change
   execute 'ALTER TABLE add_projects DROP COLUMN true'
  end
end
