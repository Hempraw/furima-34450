# README
# データベース設計
## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :products
- has_many :orders

## product テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| product_status_id   | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image

## Orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association
- belongs_to :product
- belongs_to :user
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_number | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | foreign_key: true              |

### Association
- belongs_to :order
