class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true #roomの外部キー
      t.references :user, foreign_key: true #userの外部キー
      t.timestamps
    end
  end
end
