# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#テーブル設計

# users テーブル設計

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | integer | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :purchases


# items テーブル設計

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| image            |            |             |
| item_name        | string     | null: false |
| item_description | text       | null: false |
| item_category    | string     | null: false |
| item_condition   | string     | null: false |
| delivery_burden  | string     | null: false |
| delivery_area    | string     | null: false |
| delivery_day     | integer    | null: false |
| sale_price       | integer    | null: false |
| sale_commission  | integer    | null: false |
| sale_profit      | integer    | null: false |
| user             | references | null: false |

### Association

- belongs_to :user
- has_one :purchase
- has_one :attached :image

# purchases テーブル設計

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

# addresses テーブル設計

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  | null: false |
| phone number  | integer | null: false |

### Association

- belongs_to :purchase