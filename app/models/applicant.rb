class Applicant < ActiveRecord::Base
  acts_as_paranoid
  acts_as_taggable_on :area_of_expertise
  has_attached_file :resume

  attr_accessible :first_name, :last_name, :middle_name, :nickname, :post, :notes, :birth_date, :gender, :email,
                  :phone_number, :resume, :experience, :area_of_expertise_list, :place_of_residence, :skype_address

  has_many :email_sending_logs, as: :emailable
  has_and_belongs_to_many :vacancies

  validates_presence_of :first_name, :last_name, :gender
  validates :email, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false, scope: :deleted_at},
            if: -> {email.present?}
  validates_attachment :resume, content_type: {content_type: Types::AllDocuments}

  scope :area_of_expertise, ->( tags ) do
    tagged_with tags
  end

  scope :post, ->( post ) do
    where(post: post)
  end

  search_methods :area_of_expertise
  search_methods :post
end
