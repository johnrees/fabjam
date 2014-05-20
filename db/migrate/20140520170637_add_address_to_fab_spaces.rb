class AddAddressToFabSpaces < ActiveRecord::Migration
  def change
    add_column :fab_spaces, :address, :text
    add_column :fab_spaces, :country_code, :string
  end
end
