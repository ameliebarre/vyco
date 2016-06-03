class Album < ActiveRecord::Base
   has_many :tracks
   has_one :style
   belongs_to :artist
end
