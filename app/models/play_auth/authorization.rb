# author Naps62
module PlayAuth
  class Authorization < ActiveRecord::Base
    
    belongs_to :user

    attr_accessible :provider,
                    :uid,
                    :user_id,
                    :email,
                    :token,
                    :name,
                    :link,
                    :image_url

  end
end