class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :fab_space
end
