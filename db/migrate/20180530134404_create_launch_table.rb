class CreateLaunchTable < ActiveRecord::Migration[5.2]
  def change
    create_table :launches do |t|
      t.string :name
      t.integer :status
      t.datetime :isostart
    end
  end
end
