class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :user, index: true
      t.belongs_to :fab_space, index: true
      t.text :details

      t.timestamps
    end
  end
end
