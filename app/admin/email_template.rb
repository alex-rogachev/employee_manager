ActiveAdmin.register EmailTemplate do
  breadcrumb {}
  batch_action :destroy, false
  config.filters = false

  controller do
    before_filter :set_email_template, only: [:edit, :update]

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

  show do |email_template|
    attributes_table do
      row(:name) { |email_template| email_template.name.capitalize }
      row :data do
        data = ''
        email_template.data.each_pair do |attr, value|
          # TODO: rework string generation
          data << "#{attr.to_s.capitalize.gsub('_', ' ')}: #{value} "
        end
        data
      end
    end
  end
end
