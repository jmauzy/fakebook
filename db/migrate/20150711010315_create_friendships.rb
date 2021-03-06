class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requestor_id
      t.integer :requestee_id
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end
