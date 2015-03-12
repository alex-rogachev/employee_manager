ActiveAdmin.register Applicant do
  controller do
    def edit
      @page_title = 'Edit ' + resource.try(:full_name)
    end
  end

  index do
    selectable_column
    column :last_name
    column :first_name
    column :middle_name
    column :nickname
    column :post
    column :status
    column :birth_date
    column :gender do |applicant|
      format_value applicant, :gender, type: 'Gender'
    end
    column :email
    column :skype_address
    column :phone_number
    column :experience
    column :area_of_expertise do |applicant|
      format_tags applicant, :area_of_expertise, type: 'AreaOfExpertise'
    end
    column :place_of_residence

    default_actions
  end

  show :title => :full_name do |applicant|
    def row_val instance, attribute, type
      row attribute do
        format_value instance, attribute, type: type
      end
    end

    def row_tags instance, attribute, type
      row attribute do
        format_tags instance, attribute, type: type
      end
    end

    attributes_table do
      row :last_name
      row :first_name
      row :middle_name
      row :nickname
      row :post
      row :status
      row :birth_date
      row_val applicant, :gender, 'Gender'
      row :email
      row :skype_address
      row :phone_number
      row :experience
      row_tags applicant, :area_of_expertise, 'AreaOfExpertise'
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
  filter :gender, :as => :select, :collection => Types::Gender, multiple: true
  filter :email
  filter :skype_address
  filter :phone_number
  filter :experience
  filter :tagged_with, :as => :select, :collection => Types::AreaOfExpertise, multiple: true
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
      f.input :gender, as: :select, collection: Types::Gender
      f.input :email
      f.input :skype_address
      f.input :phone_number
      f.input :experience
      f.input :area_of_expertise_list, as: :select, collection: Types::AreaOfExpertise, multiple: true
      f.input :place_of_residence
      f.input :resume, :as => :file, :hint => f.object.resume_file_name
    end
    f.actions
  end
end
