FactoryGirl.define do
  factory :organization do
    name "myName"
    email "my@example.com"
    organizer "myOrganizer"
    password "password"
    password_confirmation "password"
  end
end
