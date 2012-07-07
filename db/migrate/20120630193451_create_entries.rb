class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.column :elo, :integer, :default => 1000
      t.column :games_played, :integer, :default => 0
      t.column :ladder_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
