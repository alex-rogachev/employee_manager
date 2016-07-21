ActiveAdmin.register EmailTemplate do
  menu parent: 'Emails', label: 'Templates'
  actions :index
  batch_action :destroy, false
  config.filters = false

  breadcrumb {}

  controller do
    before_filter :set_email_template, only: [:edit, :update, :show]

    def show
      @partial = "/applicant_mailer/#{@email_template.name}"
      render layout: 'active_admin'
    end

    def edit
      @email_template_form = EM::EmailTemplate::Invitation::Form.new(
        email_template: @email_template,
        data: @email_template.data,
        name: @email_template.name
      )
      render layout: 'active_admin'
    end

    def update
      @email_template_form = EM::EmailTemplate::Invitation::Form.new(
        params[:em_email_template_invitation_form].merge(
          email_template: @email_template,
          name: @email_template.name)
      )
      @email_template_form.save
      redirect_to admin_email_template_path(@email_template), notice: 'Email template has been updated successfuly'
    end

    def set_email_template
      @email_template = EmailTemplate.find(params[:id])
    end
  end

  index do
    column(:name) { |email_template| email_template.name.capitalize }
    actions defaults: false do |email_template|
      link_to 'Show', admin_email_template_path(email_template), class: 'table_links'
    end
  end
end
