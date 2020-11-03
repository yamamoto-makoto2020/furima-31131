

## users テーブル

| Column                | Type    | Options     |
| --------              | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| family_name           | string  | null: false |
| last_name             | string  | null: false |
| family_name_kana      | string  | null: false |
| last_name_kana        | string  | null: false |
| birthday_month        | integer | null: false |
| birthday_day          | integer | null: false |
| birthday_year         | integer | null: false |

### Association
- has_many :items
- has_many :purchases
- has_one  :credit_card

## items テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
| title         | string     | null: false                    |
| price         | integer    | null: false                    |
| explanation   | 
| category      | string     | null: false                    |
| image         |
| status        | string     | null: false                    |
| area          | string     | null: false                    |
| delivery_free | string     | null: false                    |
| guideline     | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :credit_card

## credit_cards テーブル

| Column           | Type       | Options                       |
| ------           | ------     | ------------                  |
| card_number      | integer    | null:false, unique:true       |   
| expiration_year  | integer    | null:false                    |
| expiration_month | integer    | null:false                    |
| security_code    | integer    | null:false                    |     
| user             | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase