require 'csv'

class FileUpload < ActiveRecord::Base

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: "text/csv" }

  after_create :todo

  private
    def todo
      self.save!
      return import
    end

    def import
      file = "public/system/file_uploads/files/000/000/00#{self.id}/original/#{self.file_file_name}"
      partner = Partner.find(self.partner_id)
      CSV.foreach(file, headers: true) do |row|
        partner.items.create!(
          chassis_no: row[0],
          size: row[1],
          container_no: row[2],
          customer: row[3]
          )
      end
    end
end
