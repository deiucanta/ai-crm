class CreatePersonCompanyConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :person_company_connections do |t|
      t.references :person, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
