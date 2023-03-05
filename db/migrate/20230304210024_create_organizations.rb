class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :subdomain
      t.string :domain

      t.timestamps
    end
  end
end
