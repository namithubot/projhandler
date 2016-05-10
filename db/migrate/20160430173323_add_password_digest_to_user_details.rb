class AddPasswordDigestToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :password_digest, :string
  end
end
