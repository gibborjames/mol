class AddCmisNoToItems < ActiveRecord::Migration
  def change
    add_column :items, :cmis_no, :string
    add_column :items, :location_out, :string
    add_column :items, :location_in, :string
    add_column :items, :status, :string
    add_column :items, :days, :string
    add_column :items, :remarks, :string
  end
end
