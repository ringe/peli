class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :type
      t.string :name
      t.integer :game_id

      t.timestamps
    end
  end
end
