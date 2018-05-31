def static_countdown(launch)
  l = launch.isostart
  time = l - Time.now.utc
  mm, ss = time.divmod(60)
  hh, mm = mm.divmod(60)
  dd, hh = hh.divmod(24)
  ("%d days, %d hours, %d minutes and %d seconds" %
  [dd, hh, mm, ss])
end

def countdown(launch)
  l = launch.isostart
  while Time.now.utc < l
    time = l - Time.now.utc
    mm, ss = time.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    printf ("\r%d days, %d hours, %d minutes and %d seconds" %
    [dd, hh, mm, ss])
    sleep 1
  end
end
