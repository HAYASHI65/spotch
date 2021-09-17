# テーブル設計

## usersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| gender_id             | integer    | null: false                    |
| birthday              | date       | null: false                    |
| nickname              | string     | null: false                    |
| sports_id             | integer    | null: false                    |
| active_area_id        | integer    | null: false                    |
| active_day_id         | integer    | null: false                    |
| active_time_id        | integer    | null: false                    |
| achievement_id        | integer    |                                |
| achievement_content   | text       |                                |
| profile               | text       |                                |

# has_many :teams
# has_many :comments
# has_many :favorites

## teamsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| team_name             | string     | null: false                    |
| sports_id             | integer    | null: false                    |
| group_id              | integer    | null: false                    |
| active_area_id        | integer    | null: false                    |
| active_day_id         | integer    | null: false                    |
| active_time_id        | integer    | null: false                    |
| place                 | text       | null: false                    |
| gender_ratio          | string     | null: false                    |
| level_id              | integer    | null: false                    |
| profile               | text       |                                |
| user                  | references | null: false, foreign_key: true |

# belongs_to :user
# has_many :comments
# has_many :favorites

## commentsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |
| text                  | text       | null: false                    |

# belongs_to user
# belongs_to :team

## favoritesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |

# belongs_to user
# belongs_to :team