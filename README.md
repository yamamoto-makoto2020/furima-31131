

## users テーブル

| Column                | Type    | Options     |
| --------              | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| family_name           | string  | null: false |
| last_name             | string  | null: false |
| family_name_kana      | string  | null: false |
| last_name_kana        | string  | null: false |
| birthday              | date    | null: false |


### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ------------     | ------     | -----------                    |
| title            | string     | null: false                    |
| price            | integer    | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| delivery_free_id | integer    | null: false                    |
| guideline_id     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| ----------     | ------     | -----------                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| orders         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

## address

| Column          | Type       | Options      |
| ---------       | --------   | ------------ |
| postal_code     | string     | null: false  |
| area_id         | integer    | null: false  |
| city            | string     | null: false  |
| house_number    | string     | null: false  |
| building_name   | string     |
| phone_number    | string     | null: false  |

### Association
- belongs_to :purchase