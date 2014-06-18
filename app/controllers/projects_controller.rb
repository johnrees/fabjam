class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
  defaults resource_class: Project.friendly

  def create
    @project = current_user.projects.new params[:project].permit!
    if @project.save
      GoogleWorker.perform_async(@project.id)
      redirect_to @project
    else
      render :new
    end
  end

  def index
    @projects = Project.where(year: (params[:year] || 2014)).order(id: :desc)
  end

private

  def permitted_params
    params.permit!
    #(:project => [:name, :description,:fab_space_id, :cover_image])
  end

end
