## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birthday           | date   | null: false |

- has_many :items
- has_many :buys

## itemsテーブル

| Column        | Type      | Options           |
| ------------- | --------- | ----------------- |
| item_name     | string    | null: false       |
| item_text     | text      | null: false       |
| user          | reference | foreign_key: true |
| category_id   | integer   | null: false       |
| status_id     | integer   | null: false       |
| postage_id    | integer   | null: false       |
| area_id       | integer   | null: false       |
| day_id        | integer   | null: false       | 
| price         | integer   | null: false       | 

- belongs_to :user
- has_one :buy

## buysテーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| user       | reference | foreign_key: true | 
| item       | reference | foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one :residence

## residencesテーブル

| Column           | Type       | Options           |  
| ---------------- | ---------- | ----------------- |
| post_number      | string     | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| build_name       | string     |                   |
| telephone_number | string     | null: false       |
| area_id          | integer    | null: false       |
| buy              | reference  | foreign_key: true |

- belongs_to :buy


