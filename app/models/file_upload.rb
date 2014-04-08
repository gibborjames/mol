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
        # binding.pry
        partner.items.find_or_create_by_booking_no!(
          leasing_company: row[0],
          chassis_no: row[1],
          size: row[2],
          container_no: row[3],
          booking_no: row[4],
          customer: row[5],
          date_out: row[6],
          time_out: row[7],
          trucker: row[8],
          plate_no: row[9],
          eir_no: row[10],
          date_in: row[11],
          time_in: row[12],
          trucker_return: row[13],
          plate_no: row[14]
          )
      end
    end
end
