class CreateWins < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.column :entry_id, :integer
      t.column :record_id, :integer
      t.timestamps
    end
  end
end
