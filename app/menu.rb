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
        launch_display_menu
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
