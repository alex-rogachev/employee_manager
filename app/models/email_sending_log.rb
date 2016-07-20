class EmailSendingLog < ActiveRecord::Base
  attr_accessible :emailable, :emailable_id, :emailable_type, :emailable_address, :name, :sent_by, :status

  belongs_to :emailable, polymorphic: true
  belongs_to :admin_user, foreign_key: :sent_by
end
