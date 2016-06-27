class User < ActiveRecord::Base

   acts_as_voter

   has_many :playlists
   has_many :favorites
   has_many :favorite_artists, through: :favorites, source: :favorited, source_type: 'Artist'
   has_many :favorite_albums, through: :favorites, source: :favorited, source_type: 'Album'
   has_many :favorite_selections, through: :selections, source: :favorited, source_type: 'Selection'

   rolify
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
end
