class AddYearToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :year, :integer, default: 2014
  end
end
