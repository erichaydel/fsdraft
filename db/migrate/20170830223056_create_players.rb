class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :team
      t.string :firstname
      t.string :lastname
      t.text :position
      t.integer :rank
      t.integer :position_rank
      t.string :type
      t.integer :roster_id
      t.integer :draft_number

      t.timestamps null: false
    end

    add_index :players, [:firstname, :lastname, :team, :type], unique: true
  end
end
