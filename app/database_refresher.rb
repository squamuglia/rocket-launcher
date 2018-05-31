def refresh_database
  Launch.date_refresher
  Mission.date_refresher
  UserLaunch.date_refresher
end
