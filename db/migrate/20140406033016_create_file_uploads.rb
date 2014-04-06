class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.integer :partner_id

      t.timestamps
    end
  end
end
