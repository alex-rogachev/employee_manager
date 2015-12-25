ActiveAdmin.register EmailTemplate do
  menu parent: 'Emails', :label => 'Templates'

  actions :index

  batch_action :destroy, false

  controller do
    before_filter :set_email_template, :set_email_template_form, only: [:edit, :update, :show]

    def show
      @page_title = @email_template.name.capitalize
      @partial    = "/applicant_mailer/#{@email_template.name}"

      render layout: 'active_admin'
    end

    def edit
      render layout: 'active_admin'
    end

    def update
      @email_template_form.attributes = params[@email_template_form.to_s.underscore]

      if @email_template_form.save
        redirect_to admin_email_template_path(@email_template), notice: 'Email template has been updated successfuly'
      else
        render action: :edit, layout: 'active_admin'
      end
    end

    def set_email_template
      @email_template = EmailTemplate.find(params[:id])
    end

    def set_email_template_form
      @email_template_form = EM::EmailTemplate.const_get(@email_template.name.capitalize)::Form.new(
        email_template: @email_template,
        name: @email_template.name,
        data: @email_template.data
      )
    end
  end

  index do
    column(:name) { |email_template| email_template.name.capitalize }
    actions defaults: false do |email_template|
      link_to 'Show', admin_email_template_path(email_template), class: 'table_links'
    end
  end

  filter :name
end
