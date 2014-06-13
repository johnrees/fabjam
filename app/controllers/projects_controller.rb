class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
  defaults resource_class: Project.friendly

  def create
    @project = current_user.projects.new permitted_params
    if @project.save
      session = GoogleDrive.login(ENV['GOOGLE_DRIVE_USER'], ENV['GOOGLE_DRIVE_PASS'])
      parent = session.root_collection.subcollection_by_title(@project.name)
      collection = parent.create_subcollection(@project.id)
      begin
        collection.acl.push({:scope_type => "default", :with_key => true, :role => "writer"})
      rescue
      end
      @project.drive_url = collection.human_url
      @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def index
    @projects = Project.where(year: (params[:year] || 2014)).order(name: :asc)
  end

private

  def permitted_params
    params[:project].permit!#(:project => [:name, :description,:fab_space_id, :cover_image])
  end

end
