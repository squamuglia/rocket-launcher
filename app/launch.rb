def display_launches
  # currently fetches by the primary key, needs to be updated based on current date
  start = 0
  finish = 9
  get_next_launches(start, finish)
  display_launch_pagination(start, finish)
end

def display_launch_pagination(start, finish)
  prompt = TTY::Prompt.new
  input = prompt.select("Navigate the list", ["Next", "Previous", "View Launch Details", "Return to Home"])
  while input != "Return to Home"
    if input == "Next"
      start, finish = next_page(start, finish)
    elsif input == "Previous"
      start, finish = previous_page(start, finish)
    elsif input == "View Launch Details"
      puts "Enter your launch number: "
      input = gets.chomp.to_i
      display_launch(Launch.find(input))
    elsif input == "Return to Home"
      return
    end
    input = prompt.select("Navigate the list", ["Next", "Previous", "View Launch Details", "Return to Home"])
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
  puts "\n===Launches #{start+1} - #{finish+1}===\n\n"
  Launch.all[start..finish].each do |launch|
    puts "ID: #{launch.id}. #{launch.name} " + "Launch Date: ".green + launch.isostart.to_s.red
  end
  puts "\n\n"
end
