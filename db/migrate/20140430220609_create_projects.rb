class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :creator
      t.belongs_to :fab_space
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
