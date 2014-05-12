require 'spec_helper'

describe "Projects" do

  it "has projects list" do
    FactoryGirl.create(:project, name: 'something')
    visit projects_path
    page.should have_title('Projects')
    page.should have_link('something')
  end

  it "has project page" do
    project = FactoryGirl.create(:project, name: 'something')
    visit project_path(project)
    page.should have_title('something')
  end

end
