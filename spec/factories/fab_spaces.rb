# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fab_space do
    name "MyString"
    slug "MyString"
    description "MyText"
    lat 1.5
    lng 1.5
  end
end
