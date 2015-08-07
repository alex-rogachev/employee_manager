ActiveAdmin.register AdminUser, :as => 'User' do
  decorate_with AdminUserDecorator

  index do
    column :first_name
    column :middle_name
    column :last_name
    column :email
    column :phone_number
    column (:gender) { |admin_user| format_value admin_user, :gender, type: 'Gender' }
    column :birth_date
    column :last_sign_in_at
    column :admin do |admin_user|
      pretty_bool admin_user.admin
    end
    actions defaults: false do |admin_user|
      link_to 'Show', admin_user_path(admin_user), class: 'table_links'
    end
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs 'Admin Details' do
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :gender, as: :select, collection: Types::Gender, prompt: 'Please select'
      f.input :birth_date, :as => :date_picker
      f.input :password
      f.input :password_confirmation
    end
    f.actions                         
  end

  show title: :full_name do |admin_user|
    attributes_table do
      row :first_name
      row :middle_name
      row :last_name
      row :email
      row :phone_number
      row_val admin_user, :gender, 'Gender'
      row :birth_date
      row :last_sign_in_at
      row :admin do |admin_user|
        pretty_bool admin_user.admin
      end
    end
  end
end                                   
