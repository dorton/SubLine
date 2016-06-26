class AdminAbility
  include CanCan::Ability
  def initialize(user)
    if user && user.super_admin?
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
