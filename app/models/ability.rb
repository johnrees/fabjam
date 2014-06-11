class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :read, Post

    if user.fab_spaces.empty?
      unless user.member
        can :create, FabSpace
        can :join, FabSpace
      end
    end

    can :accept, Member do |member|
      member.fab_space.creator == user
    end
    can :reject, Member do |member|
      member.fab_space.creator == user
    end

    can :read, FabSpace
    can :update, FabSpace, creator: user
    can :manage_participants, FabSpace, creator: user
    can :leave, FabSpace
    can :update, User, id: user.id
    can :manage, :all if user.has_role? :superadmin

  end
end
