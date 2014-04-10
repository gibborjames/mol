class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :year, :string
    add_column :items, :month, :string
    add_column :items, :service_type, :string
    add_column :items, :bound, :string
    add_column :items, :trade, :string
    add_column :items, :vessel_destination, :string
    add_column :items, :authorized_no, :string
    add_column :items, :free_time, :string
    add_column :items, :trucker_container_pick_up, :string
    add_column :items, :trucker_container_pick_up_date, :date
    add_column :items, :container_return_delivery, :string
    add_column :items, :container_return_plate_no, :string
    add_column :items, :container_return_date, :string
    add_column :items, :return_recieved_by, :string
    add_column :items, :return_chassis_no, :string
    add_column :items, :return_container_no, :string
    add_column :items, :return_shipper, :string
    add_column :items, :return_date_out, :date
    add_column :items, :return_booking_no, :string
  end
end
