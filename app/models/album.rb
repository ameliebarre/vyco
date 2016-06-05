class Album < ActiveRecord::Base
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

end
