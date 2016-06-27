class AddAttachmentAvatarToSelections < ActiveRecord::Migration
  def self.up
    change_table :selections do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :selections, :avatar
  end
end
