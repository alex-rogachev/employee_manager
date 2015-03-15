ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #   span :class => "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    columns do
      column do
        div :class => 'area_of_expertise_widget' do
          panel 'Total of applicants who have skills in:' do
            ul do
              Types::AreaOfExpertise.each do |aoe|
                li link_to "#{aoe.first}: #{Applicant.tagged_with(aoe.last).count}", controller: 'applicants', action: 'index', 'q' => {area_of_expertise: aoe.last} do
                  ul do
                    Types::Post.each do |post|
                      li link_to "#{"Types::Post".constantize.rassoc(post.last).try(:first)}: #{Applicant.tagged_with(aoe.last).where(post: post.last).count}", controller: 'applicants', action: 'index', 'q' => {area_of_expertise: aoe.last, post: post.last}
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end # content
end
