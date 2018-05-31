
def save_launch(launch)
  UserLaunch.create(user_id: $user.id, launch_id: launch.id)
end

def display_user_launches
  puts "\n===Your Saved Launches===\n\n"
  $user.reload
  saved_launches = $user.launches.map do |launch|
    launch.name
  end
  saved_launches.unshift("Return to Home")
  prompt = TTY::Prompt.new
  input = prompt.select("Select a launch to view more information: ", saved_launches)
  if input == "Return to Home"
  else
    display_launch(Launch.find_by(name: input))
  end
end
