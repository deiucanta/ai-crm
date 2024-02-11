class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.references :notable, polymorphic: true, null: false
      t.string :body

      t.timestamps
    end
  end
end
