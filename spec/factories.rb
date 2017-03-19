FactoryGirl.define do
  factory :admin do
    email { Faker::Internet.safe_email }
    password 'demoPass1@'
    first_name 'Bruce'
    last_name 'Wayne'
    company { Faker::Company.name }
  end

  factory :shift do
    day_of_week 'Monday'
    start_time '07:30'
    end_time '12:00'
    admin
  end

  factory :schedule do
    biz_year 2017
    biz_week 10
    admin
  end

  factory :employee do
    first_name 'Boaty'
    last_name 'McBoatface'
    position 'Shift Lead'
    admin
  end

end
