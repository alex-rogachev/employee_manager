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
                  post_list = Applicant.tagged_with(aoe.last).pluck(:post).uniq
                  if !(post_list.count == 1 && post_list.first.empty?)
                    ul do
                      post_list.each do |post|
                        li link_to "#{"Types::Post".constantize.rassoc(post).try(:first)}: #{Applicant.tagged_with(aoe.last).where(post: post).count}", controller: 'applicants', action: 'index', 'q' => {area_of_expertise: aoe.last, post: post} if post.present?
                      end
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
