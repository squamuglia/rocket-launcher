class Mission < ActiveRecord::Base
  belongs_to :launch

  def self.data_refresher
    Mission.all.each {|mission| mission.launch ? : mission.destroy }
  end
end
