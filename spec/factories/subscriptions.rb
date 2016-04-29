FactoryGirl.define do
  factory :subscription do
    price "9.99"
    start "2016-04-29"
    stop "2016-05-29"
    product_name "Silver TV"
    client
  end
end
