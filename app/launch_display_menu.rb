def launch_display_menu
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", ["Filter by Mission Type", "Filter by Location", "Filter by Country", "Exit"])
  while input != "Exit"
      if input == "Filter by Mission Type"
        filter_by_mission
      elsif input == "Filter by Location"
        filter_by_location
      elsif input == "Filter by Country"
        filter_by_country
      else
        puts 'Input not recognized.'
      end
      input = prompt.select("Choose an option: ", ["Filter by Mission Type", "Filter by Location", "Filter by Country", "Exit"])
  end
end


def filter_by_mission
  mission_types = Mission.all.map { |mission| mission.typeName }.uniq.unshift("Exit")
  # mission_types << "Exit"
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", mission_types)
  if input == "Exit"
  else
    filtered_missions = Mission.all.select {|mission| mission.typeName == input}
    filtered_missions.map! {|mission| mission.launch.name}
    display_filtered_launches(filtered_missions)
  end
end

def filter_by_location
  locations = Location.all.map { |location| location.name }.uniq.unshift("Exit")
  # mission_types << "Exit"
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", locations)
  if input == "Exit"
  else
    filtered_locations = Launch.all.select {|launch| launch.location.name == input}
    filtered_locations.map! {|launch| launch.name}
    display_filtered_launches(filtered_locations)
  end
end

def filter_by_country
  countries = Location.all.map { |location| location.country_code }.uniq.unshift("Exit")
  # mission_types << "Exit"
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", countries)
  if input == "Exit"
  else
    filtered_countries = Launch.all.select {|launch| launch.location.country_code == input}
    filtered_countries.map! {|launch| launch.name}
    display_filtered_launches(filtered_countries)
  end
end

def display_filtered_launches(filtered_missions)
  prompt = TTY::Prompt.new
  input = prompt.select("Choose a mission: ", filtered_missions.unshift("Exit"))
  if input == "Exit"
  else
    display_launch(Launch.find_by(name: input))
  end
end

def display_launch(launch)
  puts launch.name + " Launch Date: ".green + launch.isostart.to_s.red
  puts "Countdown to Launch: #{static_countdown(launch)}"
  puts "Launch Location: " + launch.location.name + "\n\n"
  launch.missions.each {|mission| puts "Mission Type: " + mission.typeName + "\nMission Description: " + mission.description + "\n\n"}
end


Location.all.map { |location| location.name }.uniq

Location.all.map { |location| location.country_code }.uniq
