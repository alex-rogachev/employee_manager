ActiveAdmin.register EmailSendingHistory do
  breadcrumb {}

  index do
    selectable_column
    column(:recipient, sortable: :recipient) { |historical_record| historical_record.emailable.decorate.full_name }
    column(:recipient_type, sortable: :recipient_type) { |historical_record| historical_record.emailable_type }
    column(:recipient_email_address, sortable: :recipient_email_address) { |historical_record| historical_record.emailable.email }
    column(:letter_type, sortable: :letter_type) { |historical_record| format_value historical_record, :name, type: 'Email' }
    column(:sent_by, sortable: :sent_by) { |historical_record| AdminUser.find(historical_record.sent_by).decorate.full_name }
    column(:sent_at, sortable: :sent_at) { |historical_record| historical_record.created_at }
  end
end
