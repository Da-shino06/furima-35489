class ShippingArea < ActiveHash::Base
  self.data = [
    { id: 0, date: '--' },
    { id: 1, date: '北海道' },
    { id: 2, date: '青森県' },
    { id: 3, date: '岩手県' },
    { id: 4, date: '宮城県' },
    { id: 5, date: '秋田県' },
    { id: 6, date: '山形県' },
    { id: 7, date: '福島県' },
    { id: 8, date: '茨城県' },
    { id: 9, date: '栃木県' },
    { id: 10, date: '群馬県' },
    { id: 11, date: '埼玉県' },
    { id: 12, date: '千葉県' },
    { id: 13, date: '東京都' },
    { id: 14, date: '神奈川県' },
    { id: 15, date: '新潟県' },
    { id: 16, date: '富山県' },
    { id: 17, date: '石川県' },
    { id: 18, date: '福井県' },
    { id: 19, date: '山梨県' },
    { id: 20, date: '長野県' },
    { id: 21, date: '岐阜県' },
    { id: 22, date: '静岡県' },
    { id: 23, date: '愛知県' },
    { id: 24, date: '三重県' },
    { id: 25, date: '滋賀県' },
    { id: 26, date: '京都府' },
    { id: 27, date: '大阪府' },
    { id: 28, date: '兵庫県' },
    { id: 29, date: '奈良県' },
    { id: 30, date: '和歌山県' },
    { id: 31, date: '鳥取県' },
    { id: 32, date: '島根県' },
    { id: 33, date: '岡山県' },
    { id: 34, date: '広島県' },
    { id: 35, date: '山口県' },
    { id: 36, date: '徳島県' },
    { id: 37, date: '香川県' },
    { id: 38, date: '愛媛県' },
    { id: 39, date: '高知県' },
    { id: 40, date: '福岡県' },
    { id: 41, date: '佐賀県' },
    { id: 42, date: '長崎県' },
    { id: 43, date: '熊本県' },
    { id: 44, date: '大分県' },
    { id: 45, date: '宮崎県' },
    { id: 46, date: '鹿児島県' },
    { id: 47, date: '沖縄県' }
  ]

  include ActiveHash::Associations
  has_many :items
end