require 'csv'

class FileUpload < ActiveRecord::Base

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: "text/csv" }

  belongs_to :partner
  after_create :todo

  private
    def todo
      if self.partner.name == "SPRINT"
        self.save
        return import_sprint
      elsif self.partner.name == "LMC"
        self.save
        return import_lmc
      else
        self.save
        return import_cmis
      end
    end

    def import_lmc
      file = "public/system/file_uploads/files/000/000/00#{self.id}/original/#{self.file_file_name}"
      partner = Partner.find(self.partner_id)
      CSV.foreach(file, headers: true) do |row|
        if row["LEASING COMPANY"].present?
          partner.items.find_or_create_by!(
            leasing_company: row[3],
            chassis_no: row[4],
            size: row[5],
            container_no: row[6],
            booking_no: row[7],
            customer: row[10],
            pull_out_date: row[15],
            pull_out_time_out: row[16],
            pull_out_tracker: row[17],
            pull_out_plate_no: row[18],
          )
        end
      end
    end

    def import_cmis
      file = "public/system/file_uploads/files/000/000/00#{self.id}/original/#{self.file_file_name}"
      partner = Partner.find(self.partner_id)
      CSV.foreach(file, headers: true) do |row|
        partner.items.find_or_create_by!(
          cmis_no: row[0],
          chassis_no: row[1],
          size: row[2],
          pull_out_date: row[3],
          pull_out_time_out: row[4],
          pull_out_tracker: row[5],
          pull_out_plate_no: row[6],
          booking_no: row[7],
          customer: row[8],
          location_out: row[9],
          return_date: row[10],
          return_time_in: row[11],
          return_tracker: row[12],
          return_plate_no: row[13],
          return_container_no: row[14],
          location_in: row[15],
          status: row[16],
          days: row[17],
          remarks: row[18]
        )
      end
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
