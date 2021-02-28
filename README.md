# テーブル設計

## usersテーブル

| Column                       | Type    | Options                 |
| ---------------------------- | ------- | ----------------------- |
| nickname                     | string  | null:false              |
| email                        | string  | null:false, unique:true |
| encrypted_password           | string  | null:false              |
| chinese_character_last_name  | string  | null:false              |
| chinese_character_first_name | string  | null:false              |
| kana_last_name               | string  | null:false              |
| kana_first_name              | string  | null:false              |
| birthday                     | date    | null:false              |

### Association

- has_many : items
- has_many : order_historys


## itemsテーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| item_name        | string     | null:false                   |
| text             | text       | null:false                   |
| category_id      | integer    | null:false                   |
| status_id        | integer    | null:false                   |
| delivery_cost_id | integer    | null:false                   |
| address_id       | integer    | null:false                   |
| shipping_day_id  | integer    | null:false                   |
| price            | integer    | null:false                   |
| user             | references | null:false, foreign_key:true |

### Association

- belongs_to : user
- has_one : order_history


## buyer_informationsテーブル

| Column        | Type       |                              |
| ------------- | ---------- | ---------------------------- |
| postal_code   | string     | null:false                   |
| address_id    | integer    | null:false                   |
| municipality  | string     | null:false                   |
| block_number  | string     | null:false                   |
| building_name | string     |                              |
| tel           | string     | null:false                   |

### Association

- belongs_to : order_history


## order_historysテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| user          | references | null:false, foreign_key:true |
| item          | references | null:false, foreign_key:true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : buyer_information