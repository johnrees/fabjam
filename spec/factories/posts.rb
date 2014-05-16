# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    author nil
    name "MyString"
    slug "MyString"
    body ""
    image_url "MyString"
    published_at "2014-05-16 11:21:03"
  end
end
