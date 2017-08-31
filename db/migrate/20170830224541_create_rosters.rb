class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :fantasy_team_id
      t.string :sport

      t.timestamps null: false
    end
  end
end
