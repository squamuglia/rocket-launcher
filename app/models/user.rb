class User < ActiveRecord::Base
  has_many :user_launches
  has_many :launches, through: :user_launches
end
