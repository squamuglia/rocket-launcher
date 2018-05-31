def static_countdown(launch)
  l = launch.isostart
  time = l - Time.now.utc
  mm, ss = time.divmod(60)
  hh, mm = mm.divmod(60)
  dd, hh = hh.divmod(24)
  ("%d days, %d hours, %d minutes and %d seconds" %
  [dd, hh, mm, ss])
end

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

def countdown(launch)
  puts "Press q to end timer"
  l = Launch.first.isostart
  while Time.now.utc < l
    c = char_if_pressed
    time = l - Time.now.utc
    mm, ss = time.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    printf ("\r%d days, %d hours, %d minutes and %d seconds" %
    [dd, hh, mm, ss])
    sleep 1
    break if c
  end
end

def display_countdown(launch)
  countdown(launch)
end
