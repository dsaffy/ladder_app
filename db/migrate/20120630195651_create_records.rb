class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
       t.column :gamedate, :date
       t.column :user_id, :integer
       t.timestamps
    end
  end
end
