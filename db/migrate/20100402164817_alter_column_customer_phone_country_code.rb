class AlterColumnCustomerPhoneCountryCode < ActiveRecord::Migration
  def self.up
    rename_column :customers, :phone_contry_code, :phone_country_code
  end

  def self.down
    rename_column :customers, :phone_country_code, :phone_contry_code
  end
end
