class PaginatingDecorator < Draper::CollectionDecorator
  # support for will_paginate
  delegate :total_entries, :per_page, :offset, :reorder, :page, :current_page, :total_pages, :limit_value,
           :total_count, :num_pages
end