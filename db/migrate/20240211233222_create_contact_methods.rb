class CreateContactMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_methods do |t|
      t.string :body
      t.integer :kind

      t.timestamps
    end
  end
end
