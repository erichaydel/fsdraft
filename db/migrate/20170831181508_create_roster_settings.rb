class CreateRosterSettings < ActiveRecord::Migration
  def change
    create_table :roster_settings do |t|
      t.text :definition, default: {NFL: [], NHL: [], NBA: [], MLB: []}.to_yaml


      t.timestamps null: false
    end
  end
end
