
def user_login
  # needs to have password functionality added
  puts "Please enter username: "
  username = gets.chomp
  if User.find_by(name: username)
    $user = User.find_by(name: username)
    puts "Please enter password :"
    password = gets.chomp
    tries = 0
    while tries < 3
      if $user.password == password
        return
      else
        puts "Password incorrect. Please try again. Tries remaining: #{3-tries} "
        password = gets.chomp
        tries += 1
      end
    end
    abort()
  else
    puts "User does not exist, please create an account"
    puts "Username:"
    username = gets.chomp
    create_new_user(username)
  end
end

def create_new_user(username)
  # needs to have password functionality added
  puts "Please enter a password: "
  password = gets.chomp
  $user = User.create(name: username, password: 'password')

end

def create_username
end

def create_password
end
