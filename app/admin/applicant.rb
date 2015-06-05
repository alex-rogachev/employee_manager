ActiveAdmin.register Applicant do
  batch_action :destroy, false
  batch_action :send_welcome_message do |ids|
    Applicant.find(ids).each do |applicant|
      ApplicantMailer.welcome_message(applicant)
    end
    redirect_to admin_applicants_path, alert: 'Email has been send successfully.'
  end

  controller do
    def edit
      @page_title = "Edit #{resource.try(:full_name)}"
    end
  end

  member_action :show_file, method: :get do
    @page_title = "Resume of #{resource.try(:full_name)}"
    applicant = Applicant.find(params[:id])
    @link = applicant.resume.url(:original, false)
  end

  csv do
    column :last_name
    column :first_name
    column :middle_name
    column :nickname
    column(:post) { |applicant| format_value applicant, :post, type: 'Post' }
    column :birth_date
    column(:gender) { |applicant| format_value applicant, :gender, type: 'Gender' }
    column :email
    column :skype_address
    column :phone_number
    column(:experience) { |applicant| number_to_human applicant.experience }
    column(:area_of_expertise) { |applicant| format_tags applicant, :area_of_expertise, type: 'AreaOfExpertise' }
    column :place_of_residence
    column :notes
  end

  index do
    selectable_column
    column :last_name
    column :first_name
    column :middle_name
    column :nickname
    column(:post, sortable: :post) { |applicant| format_value applicant, :post, type: 'Post' }
    column :birth_date
    column(:gender, sortable: :gender) { |applicant| format_value applicant, :gender, type: 'Gender' }
    column :email
    column :skype_address
    column :phone_number
    column(:experience, sortable: :experience) { |applicant| number_to_human applicant.experience }
    column(:area_of_expertise, sortable: :area_of_expertise) { |applicant| format_tags applicant, :area_of_expertise, type: 'AreaOfExpertise' }
    column :place_of_residence
    column :notes
    default_actions
  end

  show title: :full_name do |applicant|
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
      row_val applicant, :post, 'Post'
      row :birth_date
      row_val applicant, :gender, 'Gender'
      row :email
      row :skype_address
      row :phone_number
      row(:experience) { |applicant| number_to_human applicant.experience }
      row_tags applicant, :area_of_expertise, 'AreaOfExpertise'
      row :place_of_residence
      row :notes
      row :resume do
        if applicant.resume.present?
          link_to('Show', show_file_admin_applicant_path) +' '+ link_to('Download', applicant.resume.url(:original, false))
        end
      end
    end
  end

  filter :last_name
  filter :first_name
  filter :middle_name
  filter :nickname
  filter :post, as: :select, collection: Types::Post, multiple: true
  filter :birth_date
  filter :gender, as: :select, collection: Types::Gender, multiple: true
  filter :email
  filter :skype_address
  filter :phone_number
  filter :experience
  filter :area_of_expertise, as: :select, collection: Types::AreaOfExpertise, multiple: true
  filter :place_of_residence
  filter :notes

  form html: { multipart: true } do |f|
    f.inputs 'Applicant Details' do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :nickname
      f.input :post, as: :select, collection: Types::Post
      f.input :birth_date, as: :date_picker
      f.input :gender, as: :select, collection: Types::Gender
      f.input :email
      f.input :skype_address
      f.input :phone_number
      f.input :experience
      f.input :area_of_expertise_list, as: :select, collection: Types::AreaOfExpertise, multiple: true
      f.input :place_of_residence
      f.input :notes
      f.input :resume, as: :file, hint: f.object.resume_file_name
    end
    f.actions
  end
end
