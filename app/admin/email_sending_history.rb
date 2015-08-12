ActiveAdmin.register EmailSendingHistory do
  actions :index
  batch_action :destroy, false
  config.filters = false

  breadcrumb {}

  index do
    column(:recipient) { |historical_record| historical_record.emailable.decorate.full_name }
    column(:recipient_type) { |historical_record| historical_record.emailable_type }
    column(:recipient_email_address) { |historical_record| historical_record.emailable.email }
    column(:letter_type) { |historical_record| format_value historical_record, :name, type: 'Email' }
    column(:sent_by) { |historical_record| AdminUser.find(historical_record.sent_by).decorate.full_name }
    column(:sent_at) { |historical_record| historical_record.created_at.to_formatted_s(:db) }
  end
end
