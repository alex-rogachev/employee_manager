class WebhooksController < ApplicationController
  def sendgrid_event
    events = params[:_json]
    events.each do |event|
      emailable = Applicant.find_by_email(event[:email])
      log_record = EmailSendingLog.find_or_initialize_by_sg_id(event[:sg_message_id])
      log_record.assign_attributes(status: event[:event], emailable_id: emailable.id, emailable_type: emailable.class.name, sent_by: current_admin_user.id)
      log_record.save!
    end

    render json: {}, status: 200
  end
end