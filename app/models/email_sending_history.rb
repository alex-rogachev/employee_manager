class EmailSendingHistory < ActiveRecord::Base
  attr_accessible :emailable, :emailable_id, :emailable_type, :name, :sent_by

  belongs_to :emailable, polymorphic: true
  belongs_to :admin_user, foreign_key: :sent_by
end
