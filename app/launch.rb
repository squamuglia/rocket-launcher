def display_launches
  # currently fetches by the primary key, needs to be updated based on current date
  start = 0
  finish = 9
  get_next_launches(start, finish)
  display_launch_pagination(start, finish)
end

def display_launch_pagination(start, finish)
  prompt = TTY::Prompt.new
  input = prompt.select("Navigate the list", ["Next", "Previous", "Save", "Exit"])
  while input != "Exit"
    if input == "Next"
      start, finish = next_page(start, finish)
    elsif input == "Previous"
      start, finish = previous_page(start, finish)
    elsif input == "Save"
      save_launch
    elsif input == "Exit"
      return
    end
    input = prompt.select("Navigate the list", ["Next", "Previous", "Save", "Exit"])
  end
end

def next_page(start, finish)
  if finish+10 <= Launch.count
    start += 10
    finish += 10
    get_next_launches(start, finish)
  else
    puts "You are at the end of the list.\n"
  end
 [start, finish]
end

def previous_page(start, finish)
  if start < 10
    puts "You are at the beginning of the list.\n"
  else
    start -= 10
    finish -= 10
    get_next_launches(start, finish)
  end
  [start, finish]
end

def get_next_launches(start, finish)
  puts "\nLaunches #{start+1} - #{finish+1}"
  list_number = start + 1
  Launch.all[start..finish].each do |launch|
    puts "#{list_number}. #{launch.name} " + "Launch Date: ".green + launch.isostart.to_s.red
    list_number += 1
  end
end

def save_launch
  puts "Enter your launch number: "
  input = gets.chomp.to_i
  UserLaunch.create(user_id: $user.id, launch_id: input)
end

def display_user_launches
  puts "\n===Your Saved Launches===\n\n"
  list_number = 1
  $user.launches.map do |launch|
    puts "#{list_number}. #{launch.name} " + "Launch Date: ".green + launch.isostart.to_s.red
    list_number+=1
  end
  puts "\n\n"
end
