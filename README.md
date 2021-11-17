# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| company            | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :posts

## Posts テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| name   | string     | null: false                    |

### Association

- belongs_to :user
- has_many :members
- has_many :sheets

## Members テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post             | references | null: false, foreign_key: true |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |

### Association

- belongs_to :post
- has_many :records

## Sheets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| title  | string     | null: false                    |

### Association

- belongs_to :post
- has_many :items
- has_many :records

## Items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| sheet  | references | null: false, foreign_key: true |
| text   | string     | null: false                    |

### Association

- belongs_to :sheet

## Records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| member | references | null: false, foreign_key: true |
| sheet  | references | null: false, foreign_key: true |
| point  | integer    | null: false                    |

### Association

- belongs_to :member
- belongs_to :sheet
- has_one :comment

## Comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| record       | references | null: false, foreign_key: true |
| looking_back | text       | null: false                    |
| objective    | text       | null: false                    |

### Association

- belongs_to :record