FactoryGirl.define do
  factory :device do
    token Faker::Internet.unique.ip_v6_address
    enabled false
    platform Faker::Name.unique.name
    user User.first
  end
end
