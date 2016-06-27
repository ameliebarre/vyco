class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new

      if user.has_role?(:admin)
         can :manage, Artist
         can :manage, Playlist
         can :manage, Track
         can :manage, Album
         can :manage, Style
         can :manage, Selection
      else
         can :read, Artist
         can :read, Playlist
         can :read, Track
         can :read, Album
         can :read, Style
         can :read, Selection
      end
   end
end
