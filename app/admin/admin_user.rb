ActiveAdmin.register AdminUser, :as => "User" do
  index do
    column :first_name
    column :middle_name
    column :last_name
    column :email
    column :phone_number
    column :gender
    column :birth_date
    column :last_sign_in_at
    column :admin do |applicant|
      pretty_bool applicant.admin?
    end
    default_actions
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :gender, as: :select, collection: %w(Male Female), prompt: 'Please select'
      f.input :birth_date, :as => :date_picker
      f.input :password
      f.input :password_confirmation
    end
    f.actions                         
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
      row :first_name
      row :middle_name
      row :last_name
      row :email
      row :phone_number
      row :gender
      row :birth_date
      row :last_sign_in_at
      row :admin do |applicant|
        pretty_bool applicant.admin?
      end
    end
  end
end                                   
