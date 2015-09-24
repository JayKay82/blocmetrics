# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registered_application do
    name "Blocipedia"
    url "http://jaykay-blocipedia.herokuapp.com"
  end
end
