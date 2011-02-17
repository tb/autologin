class CreateAutologins < ActiveRecord::Migration
  def self.up
    create_table :autologins do |t|
      t.integer :user_id
      t.string :code

      t.timestamps
    end
    add_index :autologins, :code, :unique => true
    add_index :autologins, [:user_id]
  end

  def self.down
    drop_table :autologins
  end
end
