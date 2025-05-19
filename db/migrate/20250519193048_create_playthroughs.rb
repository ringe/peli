class CreatePlaythroughs < ActiveRecord::Migration[8.0]
  def change
    create_table :playthroughs do |t|
      t.integer :player_id
      t.timestamp :started_at
      t.integer :time_spent
      t.integer :score

      t.timestamps
    end
  end
end
