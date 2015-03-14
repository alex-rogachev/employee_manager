namespace :data_change do
  desc 'Assign new gender values'
  task new_gender: :environment do
    Applicant.where(gender: 'Male').update_all(gender: 'm')
    puts 'Task completed successfully'
  end

  desc 'Assign new post values'
  task new_post: :environment do
    Applicant.where(post: 'Junior').update_all(post: 'junior')
    Applicant.where(post: 'Middle').update_all(post: 'middle')
    Applicant.where(post: 'Senior').update_all(post: 'senior')
    Applicant.where(post: 'Project manager').update_all(post: 'pm')
    Applicant.where(post: 'Scrum Master').update_all(post: 'scrum')
    Applicant.where(post: 'Lead Software Engineer').update_all(post: 'leadsofteng')
    puts 'Task completed successfully'
  end

  desc 'Assign new area of expertise values'
  task new_aoe: :environment do
    Applicant.where(id: [51, 53, 96, 125, 48, 49, 50, 52]).each do |applicant|
      applicant.area_of_expertise_list << 'webdesign'
      applicant.save!
    end
    Applicant.where(id: [130, 131, 133, 132, 134]).each do |applicant|
      applicant.area_of_expertise_list << 'uiuxdesign'
      applicant.save!
    end
    Applicant.where(id: [36, 39, 38, 37, 23, 24, 25, 47, 71, 72,
                         73, 79, 30, 76, 77, 78, 31, 16, 17, 2,
                         18, 27, 20, 21, 15, 65, 66, 67, 81, 97,
                         89, 29, 88, 83, 82]).each do |applicant|
      applicant.area_of_expertise_list << 'rails'
      applicant.save!
    end
    Applicant.where(id: [109, 102, 70, 124]).each do |applicant|
      applicant.area_of_expertise_list << 'qa'
      applicant.save!
    end
    Applicant.where(id: [120, 19, 44, 28, 45, 46, 61, 75, 86, 87, 93, 113]).each do |applicant|
      applicant.area_of_expertise_list << 'php'
      applicant.save!
    end
    Applicant.where(id: [60, 90, 43, 54, 56, 121, 91, 111, 110, 92, 40, 74, 69,
                         42,84, 62, 57, 104, 126]).each do |applicant|
      applicant.area_of_expertise_list << 'dotnet'
      applicant.save!
    end
    Applicant.where(id: [55, 85, 41, 95, 59, 58, 98, 105, 106, 26, 115, 116, 118,
                         119, 14, 122, 33, 68]).each do |applicant|
      applicant.area_of_expertise_list << 'java'
      applicant.save!
    end
    Applicant.where(id: [108, 101, 94, 63, 64]).each do |applicant|
      applicant.area_of_expertise_list << 'ios'
      applicant.save!
    end
    Applicant.where(id: [117, 114]).each do |applicant|
      applicant.area_of_expertise_list << 'html'
      applicant.save!
    end
    Applicant.where(id: [103]).each do |applicant|
      applicant.area_of_expertise_list << 'cpp'
      applicant.save!
    end
    Applicant.where(id: [34, 35]).each do |applicant|
      applicant.area_of_expertise_list << ['rails', 'php']
      applicant.save!
    end
    Applicant.where(id: [123]).each do |applicant|
      applicant.area_of_expertise_list << ['rails', 'java']
      applicant.save!
    end
    Applicant.where(id: [32]).each do |applicant|
      applicant.area_of_expertise_list << ['rails', 'csharp']
      applicant.save!
    end
    Applicant.where(id: [127, 99]).each do |applicant|
      applicant.area_of_expertise_list << ['dotnet', 'java']
      applicant.save!
    end
    puts 'Task completed successfully'
  end
end
