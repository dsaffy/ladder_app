class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.column :ladder_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
