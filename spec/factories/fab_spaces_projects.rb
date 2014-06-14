# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fab_spaces_project, :class => 'FabSpacesProjects' do
    fab_space nil
    project nil
  end
end
