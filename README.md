# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| concept   | text       | null: false                    |
| seller    | references | null: false, foreign_key: true |

## purchase_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | string     | null: false, foreign_key: true |
| buyer     | references | null: false, foreign_key: true |