class CollectionDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :maximum
end