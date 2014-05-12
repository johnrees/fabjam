# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organisation do
    creator nil
    name "MyString"
    description "MyText"
    url "MyString"
  end
end
