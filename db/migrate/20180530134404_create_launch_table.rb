class CreateLaunchTable < ActiveRecord::Migration[5.2]
  def change
    create_table :launches do |t|
      t.string :name
      t.integer :status
      t.datetime :isostart
      t.integer :launch_id
    end
  end
end
