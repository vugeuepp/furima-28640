## users

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| mail                  | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name                  | string | null: false |
| name_reading          | string | null: false |
| birthday              | string | null: false |


### Association
- has_many :items
- has_many :records

## items

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| image     | string | null: false |
| item_name | string | null: false |
| about     | string | null: false |
| category  | string | null: false |
| condition | string | null: false |
| shipping  | string | null: false |
| area      | string | null: false |
| days      | string | null: false |
| price     | string | null: false |

### Association
- has_one :record

## records

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| costomer | string | null: false |
| item     | string | null: false |


### Association
- has_one :address

## address

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| house_number  | string | null: false |
| building_name | string |             |
| tel_number    | string | null: false |


### Association
- belongs_to :record
