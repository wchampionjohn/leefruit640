namespace :seed_data do
  task city: :environment do
    file_dir = Rails.root.join('config', 'seeds').to_s
    cities = JSON.parse(File.read("#{file_dir}/cities.json"))
    cities.each { |city| City.create! city }
  end
  task area: :environment do
    file_dir = Rails.root.join('config', 'seeds').to_s
    areas = JSON.parse(File.read("#{file_dir}/areas.json"))
    areas.each { |area| Area.create! area }
  end
end
