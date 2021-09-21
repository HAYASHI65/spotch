class CreateApproves < ActiveRecord::Migration[6.0]
  def change
    create_table :approves do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.timestamps
    end
  end
end
