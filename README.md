# アプリ名

**Trafee**

# 概要

**Trafee**はトレーニング(*training*)とフィードバック(*feedback*)を目的としたアプリです。
- ユーザーはスキルマップを使用してグラフで自身の成長を確認することができます。
- コメント機能で振り返りと、次回の目標を設定することができます。
- グルーブで共通のスキルマップを使用することができます。トレーナーはトレーニー全体の成長を確認することができます。

# 制作背景

教育や学習をする上で、目標を決め、定期的にフィードバックを行うことは大切だと考えています。しかし長いスパンで学習していくことはモチベーションの維持が難しく、また学習範囲が広くなると管理も難しくなってくるのではないでしょうか。
スキルマップは学習の管理や習熟度を確認できる便利なツールですが、そこにグラフなどで視覚的に成長を確認できる要素があると、より楽しく学習できるのではないかと考えました。

### 実装予定内容

- ログイン機能
- スキルマップ作成機能
- スキルマップ採点機能
- グラフ表示機能
- コメント機能
- グループ登録機能		

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

- has_many :records
- has_many :sheets
- has_many :groups, through: :user_groups
- has_many :user_groups

## Groups テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |

### Association

- has_many :users, through: user_groups
- has_many :user_groups

## User_groups テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| group            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## Sheets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| title  | string     | null: false                    |

### Association

- belongs_to :user
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

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| sheet    | references | null: false, foreign_key: true |
| point    | integer    | null: false                    |
| feedback | text       | null: false                    |
| object   | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :sheet