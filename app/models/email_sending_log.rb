class EmailSendingLog < ActiveRecord::Base
  belongs_to :emailable, polymorphic: true
  belongs_to :admin_user, foreign_key: :sent_by

  scope :queued, -> { where(status: 'queued') }
  scope :processed, -> { where(status: 'processed') }
  scope :delivered, -> { where(status: 'delivered') }
  scope :deferred, -> { where(status: 'deferred') }
  scope :failed, -> { where(status: %w(bounce dropped)) }

  def unscoped_emailable
    emailable_type.constantize.with_deleted.find(emailable_id)
  end
end
