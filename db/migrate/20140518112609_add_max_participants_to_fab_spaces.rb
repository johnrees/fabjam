class AddMaxParticipantsToFabSpaces < ActiveRecord::Migration
  def change
    add_column :fab_spaces, :max_participants, :integer
    add_column :fab_spaces, :max_organisations, :integer
  end
end
