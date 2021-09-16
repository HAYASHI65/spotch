class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name, null: false
      t.integer :sports_id, null: false
      t.integer :group_id, null: false
      t.integer :active_area_id, null: false
      t.integer :active_day_id, null: false
      t.integer :active_time_id, null: false
      t.text :place, null: false
      t.string :gender_ratio, null: false
      t.integer :level_id, null: false
      t.text :profile, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
