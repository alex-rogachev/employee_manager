ActiveAdmin.register EmailSendingLog do
  menu parent: 'Emails', :label => 'Logs'
  actions :index
  batch_action :destroy, false
  config.filters = false

  breadcrumb {}

  index do
    # TODO: change this workaround
    def emailable(historical_record)
      historical_record.emailable_type.constantize.with_deleted.find(historical_record.emailable_id)
    end

    column(:recipient) do |historical_record|
      emailable = emailable(historical_record)
      full_name = emailable.decorate.full_name
      full_name += " (deleted)" if emailable.deleted?
      full_name
    end
    column(:recipient_type) { |historical_record| historical_record.emailable_type }
    column(:recipient_email_address) { |historical_record| historical_record.emailable_address }
    # column(:letter_type) { |historical_record| format_value historical_record, :name, type: 'Email' }
    # column(:sent_by) { |historical_record| AdminUser.find(historical_record.sent_by).decorate.full_name }
    column(:sent_at) { |historical_record| historical_record.created_at.to_formatted_s(:db) }
    column(:status) do |historical_record|
      icon_with_color =
        case historical_record.status
        when 'queued'
          {'upload' => 'blue'}
        when 'processed'
          {'refresh' => 'blue'}
        when 'dropped'
          {'ban' => 'red'}
        when 'deferred'
          {'exclamation' => '#BEBE7F'}
        when 'delivered'
          {'check' => 'green'}
        when 'bounce'
          {'ban' => 'red'}
        end
      fa_icon(icon_with_color.keys.first, style: "color: #{icon_with_color.values.first}; font-size: 23px;")
    end
  end
end
