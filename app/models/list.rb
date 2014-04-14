class List < ActiveRecord::Base
  has_many :tasks , dependent: :delete_all

  def pending_task_count
    tasks.pending_count
  end

  def complete_task_count
    tasks.complete_count
  end
end