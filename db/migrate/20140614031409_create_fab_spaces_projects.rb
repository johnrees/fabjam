class CreateFabSpacesProjects < ActiveRecord::Migration
  def change
    create_table :fab_spaces_projects do |t|
      t.belongs_to :fab_space, index: true
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
