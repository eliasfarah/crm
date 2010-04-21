class ChangeCustomersPhoneField < ActiveRecord::Migration
  def self.up
    remove_column :customers, :phone
    add_column :customers, :phone_contry_code, :integer
    add_column :customers, :phone_area_code, :integer
    add_column :customers, :phone_number, :integer
  end

  def self.down
    add_column :customers, :phone
    remove_column :customers, :phone_contry_code, :integer
    remove_column :customers, :phone_area_code, :integer
    remove_column :customers, :phone_number, :integer
  end
end
