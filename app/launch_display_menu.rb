def launch_display_menu
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", ["Filter by Mission Type", "Filter by Location", "Filter by Country", "Exit"])
  while input != "Exit"
      if input == "Filter by Mission Type"
        display_launches
      elsif input == "Filter by Location"
        find_launch_by_name
      elsif input == "Filter by Country"
        display_user_launches
      else
        puts 'Input not recognized.'
      end
      input = prompt.select("Choose an option: ", ["Filter by Mission Type", "Filter by Location", "Filter by Country", "Exit"])
  end
end


def filter_by_mission
  mission_types = Mission.all.map { |mission| mission.typeName }.uniq << "Exit"
  # mission_types << "Exit"
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", mission_types)
  if input == "Exit"
  else
    Launch.all.where
  end
end

def filter_by_location

end

def filter_by_country

end

def display_filtered_launches

end


Location.all.map { |location| location.name }.uniq

Location.all.map { |location| location.country_code }.uniq
