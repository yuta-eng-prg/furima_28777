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
| Column          | Type      | Options                   |
| --------------- | --------- | ------------------------- |
| nickname        | string    | null: false, unique: true |
| email           | string    | null: false, unique: true |
| password        | string    | null: false               |
| last_name       | string    | null: false               |
| first_name      | string    | null: false               |
| last_name_kana  | string    | null: false               |
| first_name_kana | string    | null: false               |
| birthday        | date      | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | string     | null: false                    |
| category            | integer    | null: false                    |
| item_status         | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping_region     | integer    | null: false                    |
| days_until_shipping | integer    | null: false                    |
| item_price          | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                                     |
| ------- | ---------- | ------------------------------------------- |
| user_id | references | null: false, index: true, foreign_key: true |
| item_id | references | null: false, foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchases_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase