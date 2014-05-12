require 'spec_helper'

describe Project do
  it { should belong_to(:fab_space) }
  it { should belong_to(:creator) }
end
