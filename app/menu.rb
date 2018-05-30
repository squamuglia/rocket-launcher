def menu
  welcome
  input = gets.chomp.to_i
    if input == 1
      display_launches
    elsif input == 2
      find_launch_by_name
    elsif input == 3
      display_user_launches
    else
      puts 'Goodbye'
      abort()
    end
end

def welcome
puts "Welcome to the Rocket Launcher"
puts "Enter 1 to view all launches, Enter 2 to find a launch, 3 to view your saved launches, 4 to Exit"
end

def display_launches
  Launch.all[0..9].each do |launch|
    puts launch.name
  end
end

def save_launch

end

def display_user_launches

end

def find_launch_by_name


end
