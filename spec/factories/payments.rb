FactoryGirl.define do
  factory :payment do
    due_date "2016-04-29"
    paid_at nil
    subscription
    client
  end
end
