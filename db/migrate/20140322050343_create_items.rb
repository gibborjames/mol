class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.integer :partner_id
    	t.string :chassis_no
    	t.string :size
    	t.string :container_no
    	t.string :booking_no
    	t.string :customer
    	t.string :pull_out_date
    	t.string :pull_out_time_out
    	t.string :pull_out_tracker
    	t.string :pull_out_plate_no
    	t.string :return_eir_no
    	t.string :return_date
    	t.string :return_time_in
    	t.string :return_tracker
    	t.string :return_plate_no

      t.timestamps
    end
  end
end
