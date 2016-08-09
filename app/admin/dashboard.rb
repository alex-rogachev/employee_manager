ActiveAdmin.register_page "Dashboard" do
  breadcrumb {}

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        div class: 'area_of_expertise_widget' do
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
