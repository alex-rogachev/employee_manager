class EmailSendingLogDecorator < ApplicationDecorator
  include FontAwesome::Rails::IconHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper

  delegate_all

  def status_as_icon
    icon_with_color =
      case status
      when 'queued'
        {upload: 'blue'}
      when 'processed'
        {refresh: 'blue'}
      when 'dropped'
        {ban: 'red'}
      when 'deferred'
        {exclamation: '#BEBE7F'}
      when 'delivered'
        {check: 'green'}
      when 'bounce'
        {ban: 'red'}
      end
    fa_icon(icon_with_color.keys.first, style: "color: #{icon_with_color.values.first}; font-size: 23px;")
  end

  def emailable_name
    full_name = unscoped_emailable.decorate.full_name
    full_name += ' (deleted)' if unscoped_emailable.deleted?
    full_name
  end
end