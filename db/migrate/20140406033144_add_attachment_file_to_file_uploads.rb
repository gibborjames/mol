class AddAttachmentFileToFileUploads < ActiveRecord::Migration
  def self.up
    change_table :file_uploads do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :file_uploads, :file
  end
end
