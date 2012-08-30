module PlayAuth
  class Role < ActiveRecord::Base

    #### Associations ####
    # role N to N user
    has_many :role_users
    has_many :users, :through => :role_users

    #### Accessors ####
    attr_accessible :name, :desc, :users
    
  end
end
