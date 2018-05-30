$user = nil

def menu
  puts ascii.red
  welcome
  prompt = TTY::Prompt.new
  input = prompt.select("Choose an option: ", ["View all launches", "Find a launch", "View your launches", "Exit"])
  while input != "Exit"
      if input == "View all launches"
        display_launches
      elsif input == "Find a launch"
        find_launch_by_name
      elsif input == "View your launches"
        display_user_launches
      else
        puts 'Input not recognized.'
      end
      input = prompt.select("Choose an option: ", ["View all launches", "Find a launch","View your launches", "Exit"])
  end
  puts 'Goodbye.'
  abort()
end

def welcome
  puts "Welcome to the Rocket Launcher \n\n\n\n"
  user_login
  puts "Enter 1 to view all launches, Enter 2 to find a launch, 3 to view your saved launches, 4 to Exit.\n"
end

def display_launches
  # currently fetches by the primary key, needs to be updated based on current date
  start = 0
  finish = 9
  input = 0
  get_next_launches(start, finish)
  prompt = TTY::Prompt.new
  input = prompt.select("Navigate the list", ["Next", "Previous", "Save", "Exit"])
  while input != "Exit"
    if input == "Next"
      start += 10
      finish += 10
      get_next_launches(start, finish)
    elsif input == "Previous"
      if start < 10
        puts "You are at the beginning of the list.\n"
      else
        start -= 10
        finish -= 10
        get_next_launches(start, finish)
      end
    elsif input == "Save"
      save_launch
    elsif input == "Exit"
      return
    end
    input = prompt.select("Navigate the list", ["Next", "Previous", "Save", "Exit"])
  end
end

def get_next_launches(start, finish)
  puts "\nLaunches #{start+1} - #{finish+1}"
  list_number = start + 1
  Launch.all[start..finish].each do |launch|
    puts "#{list_number}. " + launch.name
    list_number += 1
  end
end

def save_launch
  puts "Enter your launch number: "
  input = gets.chomp.to_i
  UserLaunch.create(user_id: $user.id, launch_id: input)
  # binding.pry
end

def display_user_launches
  puts "\n===Your Saved Launches===\n\n"
  ctr = 1
  $user.launches.map do |launch|
    puts "#{ctr}. " + launch.name
    ctr+=1
  end
  puts "\n\n"
end

def ascii
  "
                                        _,'/
                                    _.-''._:
                            ,-:`-.-'    .:.|
                           ;-.''       .::.|
            _..------.._  / (:.       .:::.|
         ,'.   .. . .  .`/  : :.     .::::.|
       ,'. .    .  .   ./    \\ ::. .::::::.|
     ,'. .  .    .   . /      `.,,::::::::.;\\
    /  .            . /       ,',';_::::::,:_:
   / . .  .   .      /      ,',','::`--'':;._;
  : .             . /     ,',',':::::::_:'_,'
  |..  .   .   .   /    ,',','::::::_:'_,'
  |.              /,-. /,',':::::_:'_,'
  | ..    .    . /) /-:/,'::::_:',-'
  : . .     .   // / ,'):::_:',' ;
   \\ .   .     // /,' /,-.','  ./
    \\ . .  `::./,// ,'' ,'   . /
     `. .   . `;;;,/_.'' . . ,'
      ,`. .   :;;' `:.  .  ,'
     /   `-._,'  ..  ` _.-'
    (     _,'``------''  SSt
     `--''"
end


# def find_launch_by_name(name)
#   Launch.find_by(name: name)
# end
