ActiveAdmin.register EmailSendingLog do
  menu parent: 'Emails', label: 'Logs'
  actions :index
  batch_action :destroy, false

  decorate_with EmailSendingLogDecorator

  breadcrumb {}

  scope :all, default: true
  scope :queued
  scope :processed
  scope :delivered
  scope :failed

  index do
    column(:recipient) do |historical_record|
      if historical_record.unscoped_emailable.deleted?
        historical_record.emailable_name
      else
        link_to historical_record.emailable_name, polymorphic_path([:admin, historical_record.emailable])
      end
    end
    column(:recipient_type) { |historical_record| historical_record.emailable_type }
    column(:recipient_email_address) { |historical_record| historical_record.emailable_address }
    column(:sent_at) { |historical_record| historical_record.created_at.to_formatted_s(:db) }
    column(:status) { |historical_record| historical_record.status_as_icon }
  end

  filter :created_at, label: 'Sent at'
  filter :emailable_type
  filter :emailable_address
end
