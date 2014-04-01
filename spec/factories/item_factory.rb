FactoryGirl.define do
  factory :item do
    sequence(:description) { |n| "Item ##{n}" }
  end
end