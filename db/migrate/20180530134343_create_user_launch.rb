class CreateUserLaunch < ActiveRecord::Migration[5.2]
  def change
    create_table :user_launches do |t|
      t.integer :user_id
      t.integer :launch_id
    end
  end
end
