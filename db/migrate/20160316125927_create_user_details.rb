class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :user
      t.string :password
      t.string :email

      #t.primary_key :user	
      t.timestamps null: false
    end
  end
end
