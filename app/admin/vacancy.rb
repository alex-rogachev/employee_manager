ActiveAdmin.register Vacancy do
  breadcrumb {}

  decorate_with VacancyDecorator

  menu priority: 3

  batch_action :destroy, false

  member_action :assign_applicant_dialog, method: :get do
    respond_to do |format|
      format.js do
        @vacancy = Vacancy.find(params[:id])
        @applicants = Applicant.all - @vacancy.applicants
      end
    end
  end

  member_action :remove_applicant, method: :post do
    respond_to do |format|
      format.json do
        @vacancy = Vacancy.find(params[:id])
        @applicant = @vacancy.applicants.find(params['applicant_id'])
        @vacancy.applicants.delete(@applicant)

        render json: {id: @applicant.id, name: @applicant.decorate.full_name}
      end
    end
  end

  member_action :add_applicant, method: :post do
    respond_to do |format|
      format.json do
        @vacancy = Vacancy.find(params[:id])
        @applicant = Applicant.find(params['applicant_id'])
        @vacancy.applicants << @applicant

        render json: {id: @applicant.id, name: @applicant.decorate.full_name}
      end
    end
  end

  index do
    column(:technology){ |vacancy| format_value vacancy, :technology, type: 'AreaOfExpertise' }
    column(:level) { |vacancy| format_value vacancy, :level, type: 'Levels' }
    column :description
    actions defaults: false do |vacancy|
      link_to 'Show', admin_vacancy_path(vacancy), class: 'table_links'
    end
  end

  show do |applicant|
    attributes_table do
      row(:technology){ format_value vacancy, :technology, type: 'AreaOfExpertise' }
      row(:level) { format_value vacancy, :level, type: 'Levels' }
      row :description
    end
  end

  form decorate: true, html: { multipart: true } do |f|
    f.inputs 'Applicant Details' do
      f.input :technology, as: :select, collection: ::Types::AreaOfExpertise
      f.input :level, as: :select, collection: ::Types::Levels
      f.input :description, as: :text
    end
    f.actions
  end

  filter :level, as: :select, collection: ::Types::Levels, multiple: true
  filter :technology, as: :select, collection: ::Types::AreaOfExpertise, multiple: true
  filter :description
end
