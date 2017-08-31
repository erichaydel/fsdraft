class CreateFantasyTeams < ActiveRecord::Migration
  def change
    create_table :fantasy_teams do |t|
      t.string :name
      t.integer :draft_position

      t.timestamps null: false
    end
  end
end
