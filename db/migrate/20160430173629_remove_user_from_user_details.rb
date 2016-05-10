class RemoveUserFromUserDetails < ActiveRecord::Migration
  def change
    remove_column :user_details, :user, :string
  end
end
