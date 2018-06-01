def launch_display_menu
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", ["Filter by Mission Type", "Filter by Location", "Filter by Country", "Find Closest Launch", "Return to Home"])
  while input != "Return to Home"
      if input == "Filter by Mission Type"
        filter_by_mission
      elsif input == "Filter by Location"
        filter_by_location
      elsif input == "Filter by Country"
        filter_by_country
      elsif input == "Find Closest Launch"
        display_closest_launch
      else
        puts 'Input not recognized.'
      end
      input = prompt.select("Choose an option: ", ["Filter by Mission Type", "Filter by Location", "Filter by Country", "Find Closest Launch", "Return to Home"])
  end
end

def choose_option_menu(options)
  prompt = TTY::Prompt.new
  prompt.select("Choose an option: ", options)
end

def filter_by_mission
  mission_types = Mission.all.map { |mission| mission.typeName }.uniq.unshift("Return to Home")
  input = choose_option_menu(mission_types)
  if input == "Return to Home"
  else
    filtered_missions = Mission.all.select {|mission| mission.typeName == input}
    filtered_missions.map! {|mission| mission.launch.name}
    display_filtered_launches(filtered_missions)
  end
end

def filter_by_location
  locations = Location.all.map { |location| location.name }.uniq.unshift("Return to Home")
  input = choose_option_menu(locations)
  if input == "Return to Home"
  else
    filtered_locations = Launch.all.select {|launch| launch.location.name == input}
    filtered_locations.map! {|launch| launch.name}
    display_filtered_launches(filtered_locations)
  end
end

def filter_by_country
  countries = Location.all.map { |location| location.country_code }.uniq.unshift("Return to Home")
  input = choose_option_menu(countries)
  if input == "Return to Home"
  else
    filtered_countries = Launch.all.select {|launch| launch.location.country_code == input}
    filtered_countries.map! {|launch| launch.name}
    display_filtered_launches(filtered_countries)
  end
end

def display_filtered_launches(filtered_missions)
  prompt = TTY::Prompt.new
  input = prompt.select("Choose a launch: ", filtered_missions.unshift("Return to Home"))
  if input == "Return to Home"
  else
    display_launch(Launch.find_by(name: input))
  end
end

def display_closest_launch
  get_location
  display_launch(compare_pad_distances)
end

def display_launch(launch)
  puts "\n\n" + launch.name + " Launch Date: ".green + launch.isostart.to_s.red
  puts "Countdown to Launch: #{static_countdown(launch)}"
  puts "Launch Location: " + launch.location.name + "\n\n"
  launch.missions.each {|mission| puts "Mission Type: " + mission.typeName + "\nMission Description: " + mission.description + "\n\n"}
  prompt = TTY::Prompt.new
  input = prompt.select("Select an option: ", ["Return to Home", "Watch Countdown", "Save"])
  if input == "Return to Home"
  elsif input == "Watch Countdown"
    countdown(launch)
  elsif input == "Save"
    save_launch(launch)
  end
end
