class ListDecorator < ApplicationDecorator
  delegate_all

  decorates_association :tasks
end