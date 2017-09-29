class AddColumnLeaguePasswordToRosterSetting < ActiveRecord::Migration[5.1]
  def change
    add_column :roster_settings, :league_password, :string
  end
end
