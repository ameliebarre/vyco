class Track < ActiveRecord::Base

   belongs_to :album
   belongs_to :playlist

   has_attached_file :track_file

   validates_attachment_content_type :track_file, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
   #validates_with AttachmentSizeValidator,
   #attributes: :track_file,
   #less_than: 5.megabytes
   do_not_validate_attachment_file_type :track_file

end
