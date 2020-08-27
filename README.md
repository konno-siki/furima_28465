# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル  
  
| Column       | Type   | Options     |  
| ------------ | ------ | ----------- |  
| name         | string | null: false |  
| name_reading | string | null: false |  
| nickname     | string | null: false |  
| birthday     | string | null: false |  
| email        | string | null: false |  
| password     | string | null: false |  
  
### Association  
- has_many :item  
- has_many :order  

## itemsテーブル  
  
| Column   | Type       | Options           |  
| -------- | ---------- | ----------------- |  
| image    | text       |                   |  
| text     | text       | null: false       |  
| category | string     |                   |  
| brand    | string     |                   |  
| user     | references | foreign_key: true |  
  
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
| order         | references | foreign_key: true |  
  
### Association  
- belongs_to :order  
  
## ordersテーブル  
  
| Column  | Type       | Options           |  
| ------- | ---------- | ----------------- |  
| price   | integer    | null: false       |  
| user    | references | foreign_key: true |  
| item    | references | foreign_key: true |  
  
### Association  
- has_many :address  
- belongs_to :user  
- belongs_to :item  
  
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
