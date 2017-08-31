class CreateRosterSpots < ActiveRecord::Migration
  def change
    create_table :roster_spots do |t|
      t.text :position
      t.integer :roster_id
      t.integer :player_id

      t.timestamps null: false
    end

    add_index :roster_spots, :player_id, unique: true
  end
end
