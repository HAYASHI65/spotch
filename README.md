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
# has_many :applies
# has_many :team_donations
# has_one :card
# has_many :rooms, through: :user_rooms
# has_many :user_rooms
# has_many :chats

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
# has_many :applies
# has_many :team_donations

## commentsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |
| text                  | text       | null: false                    |

# belongs_to :user
# belongs_to :team

## favoritesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |

# belongs_to user
# belongs_to :team

## appliesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |

# belongs_to :user
# belongs_to :team

## cardsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| customer_token        | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

# belongs_to :user

## team_donationsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |

# belongs_to :user
# belongs_to :team
# has_one :donation

## donationsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| price                 | integer    | null: false                    |
| text                  | text       |                                |
| team_donation         | references | null: false, foreign_key: true |

# belongs_to :team_donation

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |

# has_many :users, through: :user_rooms
# has_many :user_rooms
# has_many :chats

## user_rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

# belongs_to :user
# belongs_to :room

## chats テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

# belongs_to :user
# belongs_to :room