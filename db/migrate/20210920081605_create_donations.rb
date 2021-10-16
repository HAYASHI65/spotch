class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :price, null: false
      t.text :text
      t.references :team_donation, null: false
      t.timestamps
    end
  end
end
