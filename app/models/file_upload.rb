require 'csv'

class FileUpload < ActiveRecord::Base

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: "text/csv" }

  belongs_to :partner
  after_create :todo

  private
    def todo
      self.save
      if self.partner.name == "SPRINT"
        return import_sprint
      elsif self.partner.name == "LMC"
        return import_lmc
      end
    end

    def import_lmc
      file = "public/system/file_uploads/files/000/000/00#{self.id}/original/#{self.file_file_name}"
      partner = Partner.find(self.partner_id)
      CSV.foreach(file, headers: true) do |row|
        partner.items.find_or_create_by!(
          leasing_company: row[3],
          chassis_no: row[4],
        )
      end
    end

    def import_cmis
      binding.pry
    end

    def import_sprint
      file = "public/system/file_uploads/files/000/000/00#{self.id}/original/#{self.file_file_name}"
      partner = Partner.find(self.partner_id)
      CSV.foreach(file, headers: true) do |row|
        # binding.pry
        partner.items.find_or_create_by!(
          leasing_company: row[0],
          chassis_no: row[1],
          size: row[2],
          container_no: row[3],
          booking_no: row[4],
          customer: row[5],
          pull_out_date: row[6],
          pull_out_time_out: row[7],
          pull_out_tracker: row[8],
          pull_out_plate_no: row[9],
          return_eir_no: row[10],
          return_date: row[11],
          return_time_in: row[12],
          return_tracker: row[13],
          return_plate_no: row[14]
          )
      end
    end
end
