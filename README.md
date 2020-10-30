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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has many items
- has many records
- has one streets

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | text   | ----------- |
| name   | string | null: false |
| info   | string | null: false |
| category_id     | integer | null: false |
| sales_status_id | integer | null: false |
| shipping_fee_status_id | integer | null: false |
| prefecture_id   | integer | null:false |
| scheduled_delivery_id | integer | null:false |
| price  | integer | null:false |

### Association

- belongs to users
- has one records

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to items
- belongs_to users
- has many streets

## streets テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | integer | null: false |
| prefecture  | string | null: false |
| city        | string | null: false |
| addresses   | string | null: false |
| building    | string | null: false |
| phone_number | integer | null: false

### Association

- belongs_to records
- belongs_to users
