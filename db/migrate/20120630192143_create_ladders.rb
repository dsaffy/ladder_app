class CreateLadders < ActiveRecord::Migration
  def change
    create_table :ladders do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :kvalue, :integer, :default => 32
      t.timestamps
    end
  end
end
