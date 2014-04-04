require 'spec_helper'

feature 'Tasks' do
  given!(:list) { create :list }

  context "User adds a task" do
    scenario do
      visit new_list_task_path(list)

      fill_in :task_description, with: "shitty task#432"
      click_button :task_submit

      expect(page).to have_content("shitty task#432")
    end
  end
end