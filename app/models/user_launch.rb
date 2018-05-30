class UserLaunch < ActiveRecord::Base
  belongs_to :user
  belongs_to :launch
end
