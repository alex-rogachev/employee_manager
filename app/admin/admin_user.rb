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
    column :admin
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
      f.input :gender
      f.input :birth_date
      f.input :password
      f.input :password_confirmation
    end
    f.actions                         
  end                                 
end                                   
