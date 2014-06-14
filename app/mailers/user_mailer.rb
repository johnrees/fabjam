class UserMailer < ActionMailer::Base
  default from: "FabJam <notifications@fabjam.org>"

  def new_applicant creator_id, applicant_id, fab_space_id
    @creator = User.find(creator_id)
    @applicant = User.find(applicant_id)
    @fab_space = FabSpace.find(fab_space_id)
    mail to: @creator.email, subject: "#{@applicant} has applied to participate at #{@fab_space}"
  end

  def new_project project_id
    @project = Project.find(project_id)
    @creator = @project.creator
    mail to: @creator.email, subject: "#{@project} has been created"
  end

end
