class AddUrlsToFabSpaces < ActiveRecord::Migration
  def change
    add_column :fab_spaces, :urls, :text
  end
end
