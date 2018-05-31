class UserLaunch < ActiveRecord::Base
  belongs_to :user
  belongs_to :launch

  def self.date_refresher
    UserLaunch.all.each {|userlaunch| userlaunch.launch ? true : userlaunch.destroy}
  end
end
