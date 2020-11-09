# usersテーブル
| Column           | Type       | Option        |
| ---------------- | ---------- | ------------- |
| nickname         | string     | null: false   |
| email            | string     | null: false   |
| password         | string     | null: false   |
| last_name        | string     | null: false   |
| first_name       | string     | null: false   |
| last_name_kana   | string     | null: false   |
| first_name_kana  | string     | null: false   |
| year_birth       | integer    | null: false   |
| month_birth      | integer    | null: false   |
| date_birth       | integer    | null: false   |

## Association
- has_many :items
- has_many :purchases


# itemsテーブル
| Column             | Type       | Option                           |
| ------------------ | ---------- | -------------------------------- |
| name               | string     | null: false                      |
| description        | text       | null: false                      |
| category           | string     | null: false                      |
| quality_status     | string     | null: false                      |
| delivery_burden    | string     | null: false                      |
| ship_from_location | string     | null: false                      |
| delivery_time      | string     | null: false                      |
| price              | integer    | null: false                      |
| purchase_status    | boolean    | null: false                      |
| user_id            | references | null: false, foreign_key: true   |

## Association
- belongs_to :user
- has_one :purchase


# purchasesテーブル
| Column             | Type       | Option                           |
| ------------------ | ---------- | -------------------------------- |
| postal_code        | integer    | null: false                      |
| prefecture         | string     | null: false                      |
| municipality       | string     | null: false                      |
| house_number       | string     | null: false                      |
| building_name      | string     | null: false                      |
| phone_number       | integer    |                                  |
| user               | references | null: false, foreign_key: true   |
| item               | references | null: false, foreign_key: true   |

## Association
- belongs_to :user
- belongs_to :item