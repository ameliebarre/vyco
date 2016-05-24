class AddAttachmentTrackFileToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.attachment :track_file
    end
  end

  def self.down
    remove_attachment :tracks, :track_file
  end
end
