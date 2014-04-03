require 'spec_helper'

feature "Todo Lists" do
  feature "User views a list" do

    context "when the list is empty" do
      given!(:list) { create :list }
      scenario do
        visit list_path(list)

        expect(page).to have_content(list.name)
        expect(page).to have_content("does not have any tasks")
      end

    end
      given!(:list) {create :list_with_tasks }
      scenario do
        visit list_path(list)

        expect(page).to have_content(list.name)
        list.tasks.each do |task|
          expect(page).to have_content(task.description)
        end
      end
    end


  feature "User views all lists" do
    given!(:lists) { 3.times.map { create :list } }
    scenario do
      visit lists_path
      lists.each do |list|
        expect(page).to have_content(list.name)
      end
    end
  end

  feature "User creates a list" do
    scenario do
      visit new_list_path

      fill_in :list_name, with: "toast"
      click_button :list_submit

      expect(page).to have_content('The list has been submitted.')
    end
  end

  feature "User edits a List" do
    given!(:list) { create :list }
    context "User adds a task" do
      scenario do
        visit list_path(list)
        click_link("Add a task")
        fill_in :task_name, with: "shitty task#432"
        click_button :task_submit

        expect(page).to have_content("shitty task#432")
      end
    end
  end
end
