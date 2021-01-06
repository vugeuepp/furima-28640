## users

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_reading          | string | null: false |
| first_reading         | string | null: false |
| date                  | string | null: false |


### Association
- has_many :items
- has_many :records

## items

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| item_name    | string  | null: false |
| about        | text    | null: false |
| category_id  | integer | null: false |
| condition_id | integer | null: false |
| shipping_id  | integer | null: false |
| area_id      | integer | null: false |
| days_id      | integer | null: false |
| price        | integer | null: false |

### Association
- has_one :record
- has_one :user

## records

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## address

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| tel_number    | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user

