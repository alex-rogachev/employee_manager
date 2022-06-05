ActiveAdmin.register Employee do
  #Temporary disable menu link to the resource
  menu if: proc { false }

  permit_params :first_name, :middle_name, :last_name, :nickname, :birth_date, :gender,
                   :post, :notes, :email, :phone_number, :experience, :area_of_expertise,
                   :place_of_residence, :skype_address, :resume

  breadcrumb {}

  decorate_with ApplicantDecorator

  batch_action :destroy, false

  controller do
    def edit
      @page_title = "Edit #{resource.decorate.full_name}"
    end
  end

  member_action :show_file, method: :get do
    @page_title = "Resume of #{resource.decorate.full_name}"
    employee = Employee.find(params[:id])
    @link = employee.resume.url(:original, false)

    if employee.resume_content_type.in?(Types::GoogleViewerDocuments)
      @partial = 'google_reader'
    else
      @partial = 'web_odf'
    end
  end

  csv do
    column :last_name
    column :first_name
    column :middle_name
    column :nickname
    column(:post) { |employee| format_value employee, :post, type: 'Post' }
    column :birth_date
    column(:gender) { |employee| format_value employee, :gender, type: 'Gender' }
    column :email
    column :skype_address
    column :phone_number
    column(:experience) { |employee| number_to_human employee.experience }
    column(:area_of_expertise) { |employee| format_tags employee, :area_of_expertise, type: 'AreaOfExpertise' }
    column :place_of_residence
    column :notes
  end

  index do
    selectable_column
    column :last_name
    column :first_name
    column :middle_name
    column :nickname
    column(:post, sortable: :post) { |employee| format_value employee, :post, type: 'Post' }
    column :birth_date
    column(:gender, sortable: :gender) { |employee| format_value employee, :gender, type: 'Gender' }
    column :email
    column :skype_address
    column :phone_number
    column(:experience, sortable: :experience) { |employee| number_to_human employee.experience }
    column(:area_of_expertise, sortable: :area_of_expertise) { |employee| format_tags employee, :area_of_expertise, type: 'AreaOfExpertise' }
    column :place_of_residence
    actions defaults: false do |applicant|
      link_to 'Show', admin_employee_path(applicant), class: 'table_links'
    end
  end

  show title: :full_name do |employee|
    attributes_table do
      row :last_name
      row :first_name
      row :middle_name
      row :nickname
      row_val employee, :post, 'Post'
      row :birth_date
      row_val employee, :gender, 'Gender'
      row :email
      row :skype_address
      row :phone_number
      row(:experience) { |employee| number_to_human employee.experience }
      row_tags employee, :area_of_expertise, 'AreaOfExpertise'
      row :place_of_residence
      row :notes
      row :show_resume do
        if employee.resume.present?
          link_to('Show', show_file_admin_employee_path)
        end
      end
      row :download_resume do
        if employee.resume.present?
          link_to('Download', employee.resume.url(:original, false))
        end
      end
    end
  end

  filter :last_name
  filter :first_name
  filter :middle_name
  filter :nickname
  filter :post, as: :select, collection: ::Types::Post, multiple: true
  filter :birth_date
  filter :gender, as: :select, collection: ::Types::Gender, multiple: true
  filter :email
  filter :skype_address
  filter :phone_number
  filter :experience
  filter :area_of_expertise, as: :select, collection: ::Types::AreaOfExpertise, multiple: true
  filter :place_of_residence
  filter :notes

  form decorate: true, html: { multipart: true } do |f|
    f.inputs 'Employee Details' do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :nickname
      f.input :post, as: :select, collection: ::Types::Post
      f.input :birth_date, as: :date_picker
      f.input :gender, as: :select, collection: ::Types::Gender
      f.input :email
      f.input :skype_address
      f.input :phone_number
      f.input :experience
      f.input :area_of_expertise_list, as: :select, collection: ::Types::AreaOfExpertise, multiple: true
      f.input :place_of_residence
      f.input :notes
      f.input :resume, as: :file, hint: f.object.resume_file_name
    end
    f.actions
  end
end
