class CreateApiKeys < ActiveRecord::Migration[7.1]
  def change
    create_table :api_keys do |t|
      t.string :name
      t.integer :status, default: 0
      t.string :bearer_token

      t.timestamps
    end
    add_index :api_keys, :bearer_token, unique: true
  end
end
