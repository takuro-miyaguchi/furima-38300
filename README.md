# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| concept   | text       | null: false                    |
| category  | string     | null: false                    |
| price     | integer    | null: false                    |
| seller    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase_records


## purchase_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | string     | null: false, foreign_key: true |
| buyer     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses


## shipping_addresses テーブル

| Column       | Type     | Options       |
| ------------ | -------- | ------------- |
| post_cord    | integer  | null: false   |
| address      | string   | null: false   |
| phone_number | integer  | null: false   |

### Association

- belongs_to :purchase_records