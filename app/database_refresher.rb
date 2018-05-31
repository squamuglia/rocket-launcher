def refresh_database
  User.date_refresher
  Mission.date_refresher
  UserLaunch.date_refresher
end
