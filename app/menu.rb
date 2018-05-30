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
