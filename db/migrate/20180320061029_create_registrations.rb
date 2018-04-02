class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.integer :code
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
