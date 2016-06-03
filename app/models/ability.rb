class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new

      if user.has_role?(:admin)
         can :manage, Artist
         can :manage, Playlist
         can :manage, Track
         can :manage, Album
      else
         can :read, Artist
         can :read, Playlist
         can :read, Track
         can :read, Album
      end
   end
end
