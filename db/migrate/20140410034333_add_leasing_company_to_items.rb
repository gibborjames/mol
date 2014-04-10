class AddLeasingCompanyToItems < ActiveRecord::Migration
  def change
    add_column :items, :leasing_company, :string
  end
end
