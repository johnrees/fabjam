class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
  defaults resource_class: Project.friendly

  def index
    @projects = Project.where(year: (params[:year] || 2014)).order(name: :asc)
  end

private

  def permitted_params
    params.permit!#(:project => [:name, :description,:fab_space_id, :cover_image])
  end

end
