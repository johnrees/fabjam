class AddLogoAndFablabsioIdToFabSpaces < ActiveRecord::Migration
  def change
    add_column :fab_spaces, :logo_url, :string
    add_column :fab_spaces, :fablabsio_id, :integer
  end
end
