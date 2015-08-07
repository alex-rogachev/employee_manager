class AdminUser < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :middle_name, :last_name,
                  :birth_date, :gender, :phone_number

  validates_presence_of :first_name, :last_name, :password, :password_confirmation
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
