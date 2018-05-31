require 'sinatra/activerecord'
class Launch < ActiveRecord::Base
  has_many :user_launches
  has_many :missions
  has_many :users, through: :user_launches
  belongs_to :location

  def self.date_refresher
    Launch.where("isostart < ? ", Time.now.utc).destroy_all
  end
end
