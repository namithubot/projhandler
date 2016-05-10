class AddVerifiedByAdminToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :verified_by_user, :boolean
  end
end
