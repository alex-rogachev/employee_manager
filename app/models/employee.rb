class Employee < ActiveRecord::Base
  acts_as_taggable_on :area_of_expertise
  has_attached_file :resume

  has_many :email_sending_logs, as: :emailable

  validates_presence_of :first_name, :last_name, :gender
  validates :email, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}, if: -> {email.present?}
  validates_attachment :resume, content_type: {content_type: Types::AllDocuments}

  scope :area_of_expertise, ->( tags ) do
    tagged_with tags
  end

  scope :post, ->( post ) do
    where(post: post)
  end
end
