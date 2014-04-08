FactoryGirl.define do
  factory :task do
    sequence(:description) { |n| "Task ##{n}" }
    sequence(:status) { 1 }
  end
end