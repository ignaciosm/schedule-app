FactoryGirl.define do
  factory :shift do
    day_of_week 'Monday'
    start_time '07:30'
    end_time '12:00'
    position 'Shift Lead'
    status 'active'
    admin { create(:admin, email: 'demo5@example.com') }

    trait :inactive_shift do
      status 'inactive'
      admin { create(:admin, email: 'demo6@example.com') }
    end
  end
  factory :admin do
    email 'demo@example.com'
    password 'demoPass1'
    name 'Demo'
  end

  factory :schedule do
    biz_year 2017
    biz_week 10
    admin { create(:admin, email: 'demo2@example.com') }
  end

  factory :employee do
    first_name 'Boaty'
    last_name 'McBoatface'
    position 'Shift Lead'
    status 'active'
    admin { create(:admin, email: 'demo3@example.com') }

    trait :team_member do
      last_name 'Smith'
      position 'Team Member'
      admin { create(:admin, email: 'demo4@example.com') }
    end
  end

end
