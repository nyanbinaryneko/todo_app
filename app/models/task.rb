class Task < ActiveRecord::Base
  extend Enumerize

  belongs_to :list

  scope :pending, -> { with_status :pending }
  scope :complete, -> { with_status :complete }

  enumerize :status, in: {pending: 1, complete: 2}, default: :pending, scope: true

  class << self
    def pending_count
      pending.count
    end

    def complete_count
      complete.count
    end
  end
end