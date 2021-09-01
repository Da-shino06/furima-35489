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

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| nickname | string   | null: false |
| mail     | string   | null: false |
| password | string   | null: false |
| name     | string   | null: false |
| birthday | integer  | null: false |

### Association

- has_many :items
- has_many :purchase

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product image       | string     | null: false                    |
| product name        | string     | null: false                    |
| description of item | text       | null: false                    |
| product category    | string     | null: false                    |
| product status      | integer    | null: false                    |
| delivery burden     | string     | null: false                    |
| delivery area       | string     | null: false                    |
| date until delivery | string     | null: false                    |
| selling price       | integer    | null: false                    |
| shipping charges    | string     | null: false                    |
| edit                | string     | null: false                    |
| delete              | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one   :purchase

## purchaseテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_many   :shipping address

## shipping addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| pastel code      | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building name    | string     | null: false                    |
| telephone number | integer    | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase