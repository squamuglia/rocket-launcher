class CreateMissionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :name
      t.string :description
      t.string :typeName
      t.integer :mission_id
      t.integer :launch_id
    end
  end
end
