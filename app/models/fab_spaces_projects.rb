class FabSpacesProjects < ActiveRecord::Base
  belongs_to :fab_space
  belongs_to :project
end
