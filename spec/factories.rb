FactoryGirl.define do
  factory :admin do
    email 'demo@example.com'
    password 'demoPass1'
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
    admin { create(:admin, email: 'demo3@example.com') }

    trait :team_member do
      position 'Team Member'
      admin { create(:admin, email: 'demo4@example.com') }
    end
  end

end
