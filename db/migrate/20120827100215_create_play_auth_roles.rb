class CreatePlayAuthRoles < ActiveRecord::Migration
  def change
    create_table :play_auth_roles do |t|

      t.string :name, :null => false
      t.string :desc
      
      t.timestamps
    end
  end
end
