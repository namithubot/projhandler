class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :user, primary_key = true
      t.string :password
      t.string :email

      t.timestamps null: false
    end
  end
end
