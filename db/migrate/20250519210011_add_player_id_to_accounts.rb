class AddPlayerIdToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :player_id, :string
  end
end
