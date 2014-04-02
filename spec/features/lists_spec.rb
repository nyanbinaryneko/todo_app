require 'spec_helper'

feature "Todo Lists" do
  feature "User views a list" do
    given(:list) { create :list_with_tasks }

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
end