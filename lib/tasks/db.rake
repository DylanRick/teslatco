namespace :db do
  desc "TODO"
  task add_makes: :environment do
    makes_json = JSON.parse(File.read("db/makes.json"))["makes"]
    makes_json.each do |make|
      make = Make.create!(
        edmund_id: make[1]["id"],
        name: make[1]["name"],
        nice_name: make[1]["niceName"]
      )

      puts "#{make.name} added to db"
    end
  end
end
