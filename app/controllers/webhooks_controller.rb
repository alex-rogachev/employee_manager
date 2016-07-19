class WebhooksController < ApplicationController

  def sendgrid_event
    params[:_json].each do |event|
      log_record = EmailSendingLog.find(event['smtp-id'])
      log_record.update_attribute(:status, event[:event]) unless log_record.status.in? %w(delivered failed bounced)
    end

    render nothing: true
  end
end