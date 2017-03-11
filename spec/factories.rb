FactoryGirl.define do
  factory :admin do
    email 'demo@example.com'
    password 'demoPass1'
  end

  factory :schedule do
    biz_year 2017
    biz_week 10
  end

end
