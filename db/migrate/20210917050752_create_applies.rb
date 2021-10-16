class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false
      t.timestamps
    end
  end
end
