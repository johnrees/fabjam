# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    user nil
    fab_space nil
    details "MyText"
  end
end
