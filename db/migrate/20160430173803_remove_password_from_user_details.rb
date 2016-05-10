class RemovePasswordFromUserDetails < ActiveRecord::Migration
  def change
    remove_column :user_details, :password, :string
  end
end
