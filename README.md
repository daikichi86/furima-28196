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

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_date | datetime | null: false |

### Association

- has_many items
- has_many records

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| info   | text | null: false |
| category_id     | integer | null: false |
| sales_status_id | integer | null: false |
| shipping_fee_status_id | integer | null: false |
| prefecture_id   | integer | null:false |
| scheduled_delivery_id | integer | null:false |
| price  | integer | null:false |

| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to users
- has_one records

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to items
- belongs_to users
- has_one streets

## streets テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | string | null: false |
| prefecture  | string | null: false |
| city        | string | null: false |
| addresses   | string | null: false |
| building    | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to records
