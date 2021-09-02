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

# テーブル設計

## usersテーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nickname              | string   | null: false |
| mail                  | string   | null: false |
| password              | string   | null: false |
| password_confirmation | string   | null: false |
| name_full_width       | string   | null: false |
| name_kana_full_width  | string   | null: false |
| birthday              | integer  | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| description_of_item    | text       | null: false                    |
| product_category_id    | integer    | null: false                    |
| product_status_id      | integer    | null: false                    |
| delivery_burden_id     | integer    | null: false                    |
| delivery_area_id       | integer    | null: false                    |
| date_until_delivery_id | integer    | null: false                    |
| selling_price_id       | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchaseテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| pastel_code      | string     | null: false                    |
| delivery_area    | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase