module PlayAuth
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= PlayAuth::User.new
      unregistered

      user.roles.each { |role| send role.name.downcase }

      can :read, :all
    end

    #### ROLES ####

    def unregistered

    end


    def user
      can :profile, PlayAuth::User
    end


    def admin
      can :manage, :all
    end

  end
end