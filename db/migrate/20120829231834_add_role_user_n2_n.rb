class AddRoleUserN2N < ActiveRecord::Migration
  def up
    create_table :play_auth_role_users do |t|
      t.integer :user_id
      t.integer :role_id
    end
  end

  def down
    drop_table :users_roles
  end
end
