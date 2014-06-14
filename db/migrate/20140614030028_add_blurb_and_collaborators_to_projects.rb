class AddBlurbAndCollaboratorsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :blurb, :string
    add_column :projects, :collaborators, :text
  end
end
