class WebhooksController < ApplicationController
  def sendgrid_event
    events = params[:_json]
    events.each do |event|
      log_record = EmailSendingLog.find_or_initialize_by_sg_id(event[:sg_message_id])

      if log_record.new_record?
        emailable  = Applicant.find_by_email(event[:email])
        attributes = {
          status: event[:event],
          emailable_id: emailable.id,
          emailable_type: emailable.class.name,
          recipient_email_address: event[:event]
        }
      else
        attributes = {status: event[:event]}
      end

      log_record.assign_attributes(attributes)
      log_record.save!
    end

    render json: {}, status: 200
  end
end