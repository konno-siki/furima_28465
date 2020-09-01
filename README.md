# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル  
  
| Column             | Type   | Options     |  
| ------------------ | ------ | ----------- |  
| first_name         | string | null: false |  
| last_name          | string | null: false |  
| first_name_reading | string | null: false |  
| last_name_reading  | string | null: false |  
| nickname           | string | null: false |  
| birthday           | date   | null: false |  
| email              | string | null: false |  
| password           | string | null: false |  
  
### Association  
- has_many :items  
- has_many :orders  
  
## itemsテーブル  
  
| Column     | Type       | Options           |  
| ---------- | ---------- | ----------------- |  
| image      | text       | null: false       |  
| item_name  | string     | null: false       |  
| text       | text       | null: false       |  
| category   | string     | null: false       |  
| status     | integer    | null: false       |  
| fee        | integer    | null: false       |  
| prefecture | integer    | null: false       |  
| delivery   | integer    | null: false       |  
| price      | integer    | null: false       |  
| user       | references | foreign_key: true |  
  
### Association  
- belongs_to :user  
- has_one :order  
  
## addressesテーブル  
  
| Column        | Type       | Options           |  
| ------------- | ---------- | ----------------- |  
| postal_code   | string     | null: false       |  
| prefecture    | integer    | null: false       |  
| city          | string     | null: false       |  
| house_number  | string     | null: false       |  
| building_name | string     |                   |  
| tel           | string     | null: false       |  
| order         | references | foreign_key: true |  
  
### Association  
- belongs_to :order  
  
## ordersテーブル  
  
| Column  | Type       | Options           |  
| ------- | ---------- | ----------------- |  
| user    | references | foreign_key: true |  
| item    | references | foreign_key: true |  
  
### Association  
- has_one :address  
- belongs_to :user  
- belongs_to :item  
  
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
