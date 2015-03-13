namespace :data_change do
  desc 'Assign new gender values'
  task new_gender: :environment do
    puts 'Task completed successfully'
  end

  desc 'Assign new role values'
  task new_role: :environment do
    puts 'Task completed successfully'
  end

  desc 'Assign new area of expertise values'
  task new_aoe: :environment do
    puts 'Task completed successfully'
  end
end