class FileUpload < ActiveRecord::Base

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" }
  # validates_attachment_content_type :file, :content_type => /\Axlsx\/.*\Z/
end
