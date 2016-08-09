ActiveAdmin.register Vacancy do
  breadcrumb {}

  menu priority: 3

  form decorate: true, html: { multipart: true } do |f|
    f.inputs 'Applicant Details' do
      f.input :technology, as: :select, collection: Types::AreaOfExpertise
      f.input :level, as: :select, collection: Types::Levels
      f.input :description
    end
    f.actions
  end
end
