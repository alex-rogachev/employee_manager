ActiveAdmin.register Applicant do
  index do
    selectable_column
    column :last_name
    column :first_name
    column :middle_name
    column :nickname
    column :post
    column :status
    column :birth_date
    column :gender
    column :email
    column :phone_number
    column :experience
    column :area_of_expertise
    column :place_of_residence

    default_actions
  end

  show do |applicant|
    h3 "#{applicant.last_name} #{applicant.first_name}"

    attributes_table do
      row :last_name
      row :first_name
      row :middle_name
      row :nickname
      row :post
      row :status
      row :birth_date
      row :gender
      row :email
      row :phone_number
      row :experience
      row :area_of_expertise
      row :place_of_residence
      row :resume_file_name do
        link_to applicant.resume_file_name, applicant.resume.url(:original, false) if applicant.resume.present?
      end
    end
  end

  filter :last_name
  filter :first_name
  filter :middle_name
  filter :nickname
  filter :post
  filter :status
  filter :birth_date
  filter :gender
  filter :email
  filter :phone_number
  filter :experience
  filter :area_of_expertise
  filter :place_of_residence

  form html: { multipart: true } do |f|
    f.inputs "Applicant Details" do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :nickname
      f.input :post
      f.input :status
      f.input :birth_date, :as => :date_picker
      f.input :gender, as: :select, collection: %w(Male Female), prompt: 'Please select'
      f.input :email
      f.input :phone_number
      f.input :experience
      f.input :area_of_expertise
      f.input :place_of_residence
      f.input :resume, :as => :file, :hint => f.object.resume_file_name
    end
    f.actions
  end
end
