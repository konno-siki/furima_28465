# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル  
  
| Column   | Type   | Options     |  
| -------- | ------ | ----------- |  
| name     | string | null: false |  
| email    | string | null: false |  
| password | string | null: false |  
  
### Association  
- has_many :item  
- has_many :order  

## itemsテーブル  
  
| Column  | Type       | Options           |  
| ------- | ---------- | ----------------- |  
| image   | mediumblob |                   |  
| text    | text       | null: false       |  
| user_id | references | foreign_key: true |  
  
### Association  
- belongs_to :user  
- has_one :order  

## ordersテーブル  
  
| Column  | Type       | Options           |  
| ------- | ---------- | ----------------- |  
| price   | integer    | null: false       |  
| address | text       | null: false       |  
| user_id | references | foreign_key: true |  
| item_id | references | foreign_key: true |  
  
### Association  
- belongs_to :user  
- belongs_to :item  

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
