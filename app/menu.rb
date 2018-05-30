@user = nil

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

def user_login
  # needs to have password functionality added
  puts "Please enter username"
  username = gets.chomp
  if User.find_by(name: username)
    @user = User.find_by(name: username)
  else
    puts "User does not exist, please create an account"
    puts "Username:"
    username = gets.chomp
    create_new_user(username)
  end
end

def create_new_user(username)
  # needs to have password functionality added
  @user = User.create(name: username, password: 'password')
end

def welcome
  puts "Welcome to the Rocket Launcher"
  user_login
  puts "Enter 1 to view all launches, Enter 2 to find a launch, 3 to view your saved launches, 4 to Exit"
end

def display_launches
  # currently fetches by the primary key, needs to be updated based on current date
  start = 0
  finish = 9
  input = 0
  get_next_launches(start, finish)
  puts "Enter 1 to get more launches, Enter 2 for previous, Enter 3 to save launch"
  while input < 3 && input >= 0
    input = gets.chomp.to_i
    if input == 1
      start += 10
      finish += 10
      get_next_launches(start, finish)
    elsif input == 2
      start -= 10
      finish -= 10
      get_next_launches(start, finish)
    else
      save_launch
    end
  end
end

def get_next_launches(start, finish)
  Launch.all[start..finish].each_with_index do |launch, idx|
    puts "#{idx + 1}. " + launch.name
  end
end

def save_launch
  input = gets.chomp.to_i
end

def display_user_launches

end

def find_launch_by_name


end
