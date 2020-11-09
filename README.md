## usersテーブル
| Column             | Type       | Option                    |
| ----------------   | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| birthday           | date       | null: false               |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
| Column                | Type       | Option                           |
| --------------------- | ---------- | -------------------------------- |
| name                  | string     | null: false                      |
| description           | text       | null: false                      |
| category_id           | integer    | null: false                      |
| quality_status_id     | integer    | null: false                      |
| delivery_burden_id    | integer    | null: false                      |
| ship_from_location_id | integer    | null: false                      |
| delivery_time_id      | integer    | null: false                      |
| price                 | integer    | null: false                      |
| user                  | references | null: false, foreign_key: true   |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル
| Column             | Type       | Option                           |
| ------------------ | ---------- | -------------------------------- |
| user               | references | null: false, foreign_key: true   |
| item               | references | null: false, foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column             | Type       | Option                           |
| ------------------ | ---------- | -------------------------------- |
| postal_code        | string     | null: false                      |
| prefecture_id      | integer    | null: false                      |
| municipality       | string     | null: false                      |
| house_number       | string     | null: false                      |
| building_name      | string     |                                  |
| phone_number       | string     | null: false                      |
| purchase           | references | null: false, foreign_key: true   |

### Association
- belongs_to :purchase