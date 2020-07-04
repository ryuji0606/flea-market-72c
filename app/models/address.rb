class Address < ApplicationRecord
  validates :first_name,
            :last_name,
            :first_name_kana,
            :last_name_kana,
            :postal_code,
            :prefectures,
            :municipalities,
            :street_number, presence: true
  
  valid_name_ReGex = /\A[一-龥ぁ-ん]/
  validates :first_name, :last_name, format: { with: valid_name_ReGex }

  valid_name_kana_ReGex = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, :last_name_kana, format: { with: valid_name_kana_ReGex }

  valid_postal_ReGex = /\A\d{3}[-]\d{4}\z/
  validates :postal_code, format: { with: valid_postal_ReGex }

  valid_phone_ReGex = /\A\d{10,11}\z/
  validates :telephone_number, format: { with: valid_phone_ReGex }, if: :telephone_number?
  
  belongs_to :user, optional: true

  enum prefectures: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
end
