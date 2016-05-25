class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new

      if user.has_role?(:admin)
         can :manage, Artist
         can :manage, Playlist
         can :manage, Track
      else
         can :read, Artist
         can :read, Playlist
         can :read, Track
      end
   end
end
