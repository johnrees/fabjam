class AddDriveUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :drive_url, :string
  end
end
