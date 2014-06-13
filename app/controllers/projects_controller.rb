class ProjectsController < InheritedResources::Base
  load_and_authorize_resource
  defaults resource_class: Project.friendly

  def create
    @project = current_user.projects.new params[:project].permit!
    if @project.save
      session = GoogleDrive.login(ENV['GOOGLE_DRIVE_USER'], ENV['GOOGLE_DRIVE_PASS'])
      parent = session.root_collection.subcollection_by_title('2014')
      collection = parent.create_subcollection(@project.name)
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
    params.permit!
    #(:project => [:name, :description,:fab_space_id, :cover_image])
  end

end
