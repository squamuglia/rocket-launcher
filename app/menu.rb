@user = nil

def menu
  welcome
  input = gets.chomp.to_i
  while input != 4
      if input == 1
        display_launches
      elsif input == 2
        find_launch_by_name
      elsif input == 3
        display_user_launches
      elsif input == 4
        puts 'Goodbye.'
        abort()
      else
        puts 'Input not recognized.'
      end
      puts "Enter 1 to view all launches, Enter 2 to find a launch, 3 to view your saved launches, 4 to Exit"
      input = gets.chomp.to_i
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
  if User.find_by(name: username)
    puts 'Username already exists'
  else
    @user = User.create(name: username, password: 'password')
  end
end

def welcome
  puts "Welcome to the Rocket Launcher"
  user_login
  puts "Enter 1 to view all launches, Enter 2 to find a launch, 3 to view your saved launches, 4 to Exit."
end

def display_launches
  # currently fetches by the primary key, needs to be updated based on current date
  start = 0
  finish = 9
  input = 0
  get_next_launches(start, finish)
  puts "Enter 1 to get more launches, Enter 2 for previous, Enter 3 to save launch, Enter 4 to Exit."
  while input != 4
    input = gets.chomp.to_i
    if input == 1
      start += 10
      finish += 10
      get_next_launches(start, finish)
    elsif input == 2
      start -= 10
      finish -= 10
      get_next_launches(start, finish)
    elsif input == 3
      save_launch
    elsif input == 4
      return
    end
    puts "Enter 1 to get more launches, Enter 2 for previous, Enter 3 to save launch, Enter 4 to Exit."
  end
end

def get_next_launches(start, finish)
  puts "Start: #{start}, Finish: #{finish}"
  list_number = start + 1
  Launch.all[start..finish].each do |launch|
    puts "#{list_number}. " + launch.name
    list_number += 1
  end
end

def save_launch
  puts "Enter your launch number: "
  input = gets.chomp.to_i
  UserLaunch.create(user_id: @user.id, launch_id: input)
  # binding.pry
end

def display_user_launches
  @user.launches.map do |launch|
    puts launch.name
  end
end

# def find_launch_by_name(name)
#   Launch.find_by(name: name)
# end
