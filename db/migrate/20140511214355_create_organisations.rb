class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.belongs_to :creator, index: true
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
