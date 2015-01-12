class Applicant < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_attached_file :resume
  validates_attachment :resume, content_type: { content_type: ["application/pdf","application/vnd.ms-excel",
                                                               "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                                               "application/msword",
                                                               "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                                               "text/plain"] }
  attr_accessible :first_name, :last_name, :middle_name, :nickname, :post, :status, :birth_date, :gender,
                  :email, :phone_number, :resume, :experience, :area_of_expertise, :place_of_residence
  validates_presence_of :first_name, :last_name, :post, :birth_date, :gender
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
