require 'io/wait'

def char_if_pressed
  begin
    system("stty raw -echo") # turn raw input on
    c = nil
    if $stdin.ready?
      c = $stdin.getc
    end
    c.chr if c
  ensure
    system "stty -raw echo" # turn raw input off
  end
end

while true
  c = char_if_pressed
  break if c
  sleep 1
  puts "tick"
end
