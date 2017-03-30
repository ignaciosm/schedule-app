FactoryGirl.define do
  factory :admin do
    email       { Faker::Internet.safe_email }
    password    'demoPass1@'
    first_name  'Bruce'
    last_name   'Wayne'
    company     { Faker::Company.name }
  end

  factory :available_time do
    day_of_week 'Monday'
    start_time  '11:00'
    end_time    '15:00'
    admin
  end

  factory :schedule do
    business_year 2017
    business_week 10
    admin
  end

  factory :employee do
    first_name  'Boaty'
    last_name   'McBoatface'
    position    'Shift Lead'
    admin
  end

  factory :shift do
    start_time  '7:30 am'
    end_time    '4:00 pm'
    day_of_week 'Monday'
    employee_id { [FactoryGirl.create(:employee)] }
  end

end
