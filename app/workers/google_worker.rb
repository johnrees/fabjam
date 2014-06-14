class GoogleWorker
  include Sidekiq::Worker
  # sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(project_id)
    @project = Project.find(project_id)
    session = GoogleDrive.login(ENV['GOOGLE_DRIVE_USER'], ENV['GOOGLE_DRIVE_PASS'])
    parent = session.root_collection.subcollection_by_title('2014')
    collection = parent.create_subcollection(@project.name)
    begin
      collection.acl.push({:scope_type => "default", :with_key => true, :role => "writer"})
    rescue
    end
    @project.update_attribute(:drive_url, collection.human_url)
  end

end