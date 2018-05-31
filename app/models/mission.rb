class Mission < ActiveRecord::Base
  belongs_to :launch

  def self.date_refresher
    Mission.all.each {|mission| mission.launch ? true : mission.destroy }
  end
end
