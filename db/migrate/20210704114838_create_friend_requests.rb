class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :req_received, index: true
      t.timestamps
    end
    add_foreign_key :friend_requests, :users, column: :req_received_id
  end
end
