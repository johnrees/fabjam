class StaticController < ApplicationController
  def home
    @projects = Project.all
    @fab_spaces = FabSpace.all
  end

  def about
  end
end
