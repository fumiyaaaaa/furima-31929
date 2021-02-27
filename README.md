# テーブル設計

## usersテーブル

| Column                 | Type    | Options    |
| ---------------------- | ------- | ---------- |
| nickname               | string  | null:false |
| email                  | string  | null:false |
| password               | string  | null:false |
| chinese_character_name | string  | null:false |
| kana_name              | string  | null:false |
| birthday               | integer | null:false |

### Association

- has_many : items
- has_many : buys


## itemsテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| item_name     | string     | null:false                   |
| text          | text       | null:false                   |
| category      | string     | null:false                   |
| status        | string     | null:false                   |
| delivery_cost | string     | null:false                   |
| shipping_area | string     | null:false                   |
| shipping_day  | string     | null:false                   |
| price         | integer    | null:false                   |
| user          | references | null:false, foreign_key:true |

### Association

- belongs_to : user
- has_one : buy


## buysテーブル

| Column          | Type       |                              |
| --------------- | ---------- | ---------------------------- |
| card_number     | integer    | null:false                   |
| expiration_date | integer    | null:false                   |
| security_code   | integer    | null:false                   |
| postal_code     | integer    | null:false                   |
| prefectures     | string     | null:false                   |
| municipality    | string     | null:false                   |
| address         | string     | null:false                   |
| building_name   | string     |                              |
| tel             | integer    | null:false                   |
| user            | references | null:false, foreign_key:true |
| item            | references | null:false, foreign_key:true |

### Association
- belongs_to : user
- belongs_to : item