# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |商品名
| concept      | text       | null: false                    |商品の説明
| category_id  | integer    | null: false                    |カテゴリー
| condition_id | integer    | null: false                    |商品の状態
| charge_id    | integer    | null: false                    |配送料の負担
| sender_id    | integer    | null: false                    |発送元の地域
| period_id    | integer    | null: false                    |発送日の目安
| price        | integer    | null: false                    |価格
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | string     | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |郵便番号
| prefecture_id | integer    | null: false                    |都道府県
| municipality  | string     | null: false                    |市区町村
| address       | string     | null: false                    |番地
| building      | string     |                                |建物名
| phone_number  | string     | null: false                    |電話番号
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order