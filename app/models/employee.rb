class Employee < ActiveRecord::Base
  attr_accessible :area_of_expertise, :birth_date, :email, :experience, :first_name, :gender, :last_name, :middle_name, :nickname, :notes, :phone_number, :place_of_residence, :post, :skype_address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  acts_as_taggable_on :area_of_expertise
  has_attached_file :resume
  validates_attachment :resume, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",
                                                               "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                                               "application/msword",
                                                               "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                                               "application/vnd.oasis.opendocument.text",
                                                               "application/vnd.oasis.opendocument.formula",
                                                               "text/plain"] }
  attr_accessible :first_name, :last_name, :middle_name, :nickname, :post, :notes, :birth_date, :gender,
                  :email, :phone_number, :resume, :experience, :area_of_expertise_list, :place_of_residence, :skype_address
  validates_presence_of :first_name, :last_name, :gender
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, if: -> { email.present? }

  scope :area_of_expertise, ->( tags ) do
    tagged_with tags
  end

  scope :post, ->( post ) do
    where(post: post)
  end

  search_methods :area_of_expertise
  search_methods :post

  def full_name
    "#{first_name} #{last_name}"
  end
end