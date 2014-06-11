class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :fab_space

  include Workflow
  workflow do
    state :unverified do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :accepted do
      event :reject, :transitions_to => :rejected
    end
    state :rejected do
      event :accept, :transitions_to => :accepted
    end

  end

end
