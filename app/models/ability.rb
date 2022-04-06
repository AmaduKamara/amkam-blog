class Ability
  include CanCan::Ability
  def initialize(user)
    # guest user (not logged in)
    user ||= User.new
    can :read, :all
    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Comment, author_id: user.id
      can :manage, Post, author_id: user.id
      can :read, :all
    end
  end
end
