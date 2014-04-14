require 'spec_helper'

feature 'Tasks' do
  given!(:list) { create :list_with_tasks }
  given(:task) { list.tasks.first }

  feature "User adds a task" do
    scenario do
      visit new_list_task_path(list)

      fill_in :task_description, with: "shitty task#432"
      click_button :task_submit

      expect(page).to have_content("shitty task#432")
    end
  end

  feature "User edits a task" do
    scenario do
      visit edit_list_task_path(list, task)

      fill_in :task_description, with: "shitty edited task#1"
      select("Complete", from: "Status")
      click_button :task_submit

      expect(find_by_id("task_#{task.id}")).to have_content("shitty edited task#1")

      expect(page).to have_content("Complete")
    end
  end

  feature "User deletes a task" do
    scenario do
      visit list_path(list)

      click_link "delete_task_#{task.id}", match: :first

      expect(page).to_not have_content(task.description)
    end
  end
end