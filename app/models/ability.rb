class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :read, Post
    can :read, FabSpace
    can :read, Project

    unless user.new_record?

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


      can :update, FabSpace, creator: user
      can :manage_participants, FabSpace, creator: user
      can :leave, FabSpace
      can :update, User, id: user.id
      can :manage, Project, creator: user
      can :manage, :all if user.has_role? :superadmin
      # cannot :manage, Project unless user.has_role? :everything

    end

  end
end
