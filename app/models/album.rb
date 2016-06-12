class Album < ActiveRecord::Base

   extend FriendlyId

   include SearchCop

   has_many :tracks
   belongs_to :style
   belongs_to :artist

   has_attached_file :avatar, styles: { medium: '300x300', thumb: '150x150' }

   validates_attachment_content_type :avatar, content_type: /\Aimage/
   validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
   validates_with AttachmentSizeValidator,
      attributes: :avatar,
      less_than: 5.megabytes
   do_not_validate_attachment_file_type :avatar

   search_scope :search do
      attributes :name, :slug
   end

   friendly_id :slug_candidates, use: [:slugged, :finders]

   def slug_candidates
      [ :name, [:id, :name] ]
   end

   def should_generate_new_friendly_id?
      name_changed? || super
   end

end
