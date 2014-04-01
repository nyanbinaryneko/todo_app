FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "Todo List ##{n}"}

    factory :list_with_items do
      after(:create) do |instance|
        3.times do
          create :item, list: instance
        end
      end
    end
  end
end