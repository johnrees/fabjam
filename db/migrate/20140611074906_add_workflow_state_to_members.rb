class AddWorkflowStateToMembers < ActiveRecord::Migration
  def change
    add_column :members, :workflow_state, :string
    Member.update_all(workflow_state: 'unverified')
  end
end
