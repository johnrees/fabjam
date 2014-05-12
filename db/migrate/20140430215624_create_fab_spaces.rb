class CreateFabSpaces < ActiveRecord::Migration
  def change
    create_table :fab_spaces do |t|
      t.belongs_to :creator
      t.string :name
      t.string :slug
      t.text :description
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
