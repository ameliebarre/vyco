class User < ActiveRecord::Base

   acts_as_voter

   has_many :playlists

   has_many :favorites
   has_many :favorite_artists, through: :favorites, source: :favorited, source_type: 'Artist'

   rolify
   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
end
