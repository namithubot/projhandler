class AddUsernameDigestToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :username, :string
  end
end
