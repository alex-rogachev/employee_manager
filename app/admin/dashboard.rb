ActiveAdmin.register_page "Dashboard" do
  breadcrumb {}

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        div class: 'area_of_expertise_widget' do
          panel 'Total of applicants who have skills in:' do
            render 'area_of_expertise_widget'
          end
        end
      end
      column do
        div class: 'area_of_expertise_widget' do
          panel 'Open vacancies:' do
            if Vacancy.count > 0
              render 'open_vacancies_widget'
            else
              render 'no_open_vacancies'
            end
          end
        end
      end
    end
  end # content
end
