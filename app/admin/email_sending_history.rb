ActiveAdmin.register EmailSendingHistory do
  index do
    selectable_column
    column(:type, sortable: :post) { |historical_record| "#{historical_record.emailable_type}" }
  end
end
