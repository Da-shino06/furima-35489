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

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| nickname              | string   | null: false               |
| email                 | string   | unique :true, null: false |
| encrypted_password    | string   | null: false               |
| last_name             | string   | null: false               |
| first_name            | string   | null: false               |
| last_name_furigana    | string   | null: false               |
| first_name_furigana   | string   | null: false               |
| birthday              | date     | null: false               |

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
| shipping_charge_id     | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| day_to_ship_id         | integer    | null: false                    |
| selling_price          | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postel_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase