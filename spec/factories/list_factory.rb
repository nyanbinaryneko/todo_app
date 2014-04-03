FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "Todo List ##{n}"}

    factory :list_with_tasks do
      after(:create) do |instance|
        3.times do
          create :task, list: instance
        end
      end
    end

    factory :list_with_no_tasks do

    end
  end
end