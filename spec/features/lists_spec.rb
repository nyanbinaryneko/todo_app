require 'spec_helper'

feature "Todo Lists" do
  feature "User views a list" do
    given(:list) { create :list_with_items }

    scenario do
      visit list_path(list)

      list.items.each do |item|
        expect(page).to have_content(item.description)
      end
    end
  end
end