class AddAcceptingParticipantsToFabSpaces < ActiveRecord::Migration
  def change
    add_column :fab_spaces, :accepting_participants, :boolean, default: true
  end
end
