seed_type = ARGV[0]

positions = [
  { name: '投手' },
  { name: '捕手' },
  { name: '一塁手' },
  { name: '二塁手' },
  { name: '三塁手' },
  { name: '遊撃手' },
  { name: '左翼手' },
  { name: '中堅手' },
  { name: '右翼手' },
  { name: '指名打者' }
]

prefectures = [
  { name: '北海道', hiragana: 'ほっかいどう', katakana: 'ホッカイドウ', alphabet: 'Hokkaido' },
  { name: '青森県', hiragana: 'あおもりけん', katakana: 'アオモリケン', alphabet: 'Aomori' },
  { name: '岩手県', hiragana: 'いわてけん', katakana: 'イワテケン', alphabet: 'Iwate' },
  { name: '宮城県', hiragana: 'みやぎけん', katakana: 'ミヤギケン', alphabet: 'Miyagi' },
  { name: '秋田県', hiragana: 'あきたけん', katakana: 'アキタケン', alphabet: 'Akita' },
  { name: '山形県', hiragana: 'やまがたけん', katakana: 'ヤマガタケン', alphabet: 'Yamagata' },
  { name: '福島県', hiragana: 'ふくしまけん', katakana: 'フクシマケン', alphabet: 'Fukushima' },
  { name: '茨城県', hiragana: 'いばらきけん', katakana: 'イバラキケン', alphabet: 'Ibaraki' },
  { name: '栃木県', hiragana: 'とちぎけん', katakana: 'トチギケン', alphabet: 'Tochigi' },
  { name: '群馬県', hiragana: 'ぐんまけん', katakana: 'グンマケン', alphabet: 'Gunma' },
  { name: '埼玉県', hiragana: 'さいたまけん', katakana: 'サイタマケン', alphabet: 'Saitama' },
  { name: '千葉県', hiragana: 'ちばけん', katakana: 'チバケン', alphabet: 'Chiba' },
  { name: '東京都', hiragana: 'とうきょうと', katakana: 'トウキョウト', alphabet: 'Tokyo' },
  { name: '神奈川県', hiragana: 'かながわけん', katakana: 'カナガワケン', alphabet: 'Kanagawa' },
  { name: '新潟県', hiragana: 'にいがたけん', katakana: 'ニイガタケン', alphabet: 'Niigata' },
  { name: '富山県', hiragana: 'とやまけん', katakana: 'トヤマケン', alphabet: 'Toyama' },
  { name: '石川県', hiragana: 'いしかわけん', katakana: 'イシカワケン', alphabet: 'Ishikawa' },
  { name: '福井県', hiragana: 'ふくいけん', katakana: 'フクイケン', alphabet: 'Fukui' },
  { name: '山梨県', hiragana: 'やまなしけん', katakana: 'ヤマナシケン', alphabet: 'Yamanashi' },
  { name: '長野県', hiragana: 'ながのけん', katakana: 'ナガノケン', alphabet: 'Nagano' },
  { name: '岐阜県', hiragana: 'ぎふけん', katakana: 'ギフケン', alphabet: 'Gifu' },
  { name: '静岡県', hiragana: 'しずおかけん', katakana: 'シズオカケン', alphabet: 'Shizuoka' },
  { name: '愛知県', hiragana: 'あいちけん', katakana: 'アイチケン', alphabet: 'Aichi' },
  { name: '三重県', hiragana: 'みえけん', katakana: 'ミエケン', alphabet: 'Mie' },
  { name: '滋賀県', hiragana: 'しがけん', katakana: 'シガケン', alphabet: 'Shiga' },
  { name: '京都府', hiragana: 'きょうとふ', katakana: 'キョウトフ', alphabet: 'Kyoto' },
  { name: '大阪府', hiragana: 'おおさかふ', katakana: 'オオサカフ', alphabet: 'Osaka' },
  { name: '兵庫県', hiragana: 'ひょうごけん', katakana: 'ヒョウゴケン', alphabet: 'Hyogo' },
  { name: '奈良県', hiragana: 'ならけん', katakana: 'ナラケン', alphabet: 'Nara' },
  { name: '和歌山県', hiragana: 'わかやまけん', katakana: 'ワカヤマケン', alphabet: 'Wakayama' },
  { name: '鳥取県', hiragana: 'とっとりけん', katakana: 'トットリケン', alphabet: 'Tottori' },
  { name: '島根県', hiragana: 'しまねけん', katakana: 'シマネケン', alphabet: 'Shimane' },
  { name: '岡山県', hiragana: 'おかやまけん', katakana: 'オカヤマケン', alphabet: 'Okayama' },
  { name: '広島県', hiragana: 'ひろしまけん', katakana: 'ヒロシマケン', alphabet: 'Hiroshima' },
  { name: '山口県', hiragana: 'やまぐちけん', katakana: 'ヤマグチケン', alphabet: 'Yamaguchi' },
  { name: '徳島県', hiragana: 'とくしまけん', katakana: 'トクシマケン', alphabet: 'Tokushima' },
  { name: '香川県', hiragana: 'かがわけん', katakana: 'カガワケン', alphabet: 'Kagawa' },
  { name: '愛媛県', hiragana: 'えひめけん', katakana: 'エヒメケン', alphabet: 'Ehime' },
  { name: '高知県', hiragana: 'こうちけん', katakana: 'コウチケン', alphabet: 'Kochi' },
  { name: '福岡県', hiragana: 'ふくおかけん', katakana: 'フクオカケン', alphabet: 'Fukuoka' },
  { name: '佐賀県', hiragana: 'さがけん', katakana: 'サガケン', alphabet: 'Saga' },
  { name: '長崎県', hiragana: 'ながさきけん', katakana: 'ナガサキケン', alphabet: 'Nagasaki' },
  { name: '熊本県', hiragana: 'くまもとけん', katakana: 'クマモトケン', alphabet: 'Kumamoto' },
  { name: '大分県', hiragana: 'おおいたけん', katakana: 'オオイタケン', alphabet: 'Oita' },
  { name: '宮崎県', hiragana: 'みやざきけん', katakana: 'ミヤザキケン', alphabet: 'Miyazaki' },
  { name: '鹿児島県', hiragana: 'かごしまけん', katakana: 'カゴシマケン', alphabet: 'Kagoshima' },
  { name: '沖縄県', hiragana: 'おきなわけん', katakana: 'オキナワケン', alphabet: 'Okinawa' }
]

baseball_categories = [
  '小学生（硬式）', '小学生（軟式）',
  # 中学硬式
  'ボーイズリーグ（中学生の部）', 'リトルシニアリーグ', 'ヤングリーグ', 'ポニーリーグ', 'プロンコリーグ', 'フレッシュリーグ', 'ジャパンリーグ',
  # 中学硬式
  '中学（軟式）',
  # 高校硬式
  '高校（硬式）',
  # 高校軟式
  '高校（軟式）',
  # 大学硬式
  '北海道学生野球連盟',
  '札幌学生野球連盟',
  '北東北大学野球連盟',
  '仙台六大学野球連盟',
  '南東北大学野球連盟',
  '千葉県大学野球連盟',
  '関甲新学生野球連盟',
  '東京新大学野球連盟',
  '東京六大学野球連盟',
  '東都大学野球連盟',
  '首都大学野球連盟',
  '神奈川大学野球連盟',
  '愛知大学野球連盟',
  '東海地区大学野球連盟',
  '北陸大学野球連盟',
  '関西学生野球連盟',
  '関西六大学野球連盟',
  '阪神大学野球連盟',
  '近畿学生野球連盟',
  '京滋大学野球連盟',
  '広島六大学野球連盟',
  '中国地区大学野球連盟',
  '四国地区大学野球連盟',
  '九州六大学野球連盟',
  '福岡六大学野球連盟',
  '九州地区大学野球連盟',
  # 大学軟式
  '北海道地区大学軟式野球連盟',
  '奥羽地区大学軟式野球連盟',
  '東北地区大学軟式野球連盟',
  '北関東大学軟式野球連盟',
  '東京六大学軟式野球連盟',
  '東都大学軟式野球連盟',
  '首都大学軟式野球連盟',
  '東関東大学軟式野球連盟',
  '南関東大学軟式野球連盟',
  '関東新大学軟式野球連盟',
  '東京新大学軟式野球連盟',
  '東海学生軟式野球連盟',
  '長野県大学軟式野球連盟',
  '新潟地区大学軟式野球連盟',
  '北陸地区大学軟式野球連盟',
  '近畿学生軟式野球連盟',
  '関西六大学軟式野球連盟',
  '西都大学軟式野球連盟',
  '京滋大学軟式野球連盟',
  '中国地区大学軟式野球連盟',
  '四国地区大学軟式野球連盟',
  '九州地区大学軟式野球連盟',
  '沖縄県大学軟式野球連盟',
  # JABA
  '北海道地区（JABA）',
  '東北地区（JABA）',
  '北信越地区（JABA）',
  '北関東地区（JABA）',
  '南関東地区（JABA）',
  '東京地区（JABA）',
  '西関東地区（JABA）',
  '東海地区（JABA）',
  '近畿地区（JABA）',
  '中国地区（JABA）',
  '四国地区（JABA）',
  '九州地区（JABA）',
  # 独立リーグ
  '四国アイランドリーグplus',
  'ルートインBCリーグ',
  '九州アジアリーグ',
  '北海道フロンティアリーグ',
  '日本海リーグ',
  'さわかみ関西独立リーグ',
  '北海道ベースボールリーグ',
  '日本海オセアンリーグ',
  # 社会人軟式
  '社会人（軟式）',
  # 女子野球
  '女子中学（硬式）',
  '女子高校（硬式）',
  '女子大学（硬式）',
  '女子企業・クラブ（硬式）'
]

Position.create(positions) if seed_type == 'positions'

if seed_type == 'prefectures'
  prefectures.each do |pref|
    Prefecture.find_or_create_by!(name: pref[:name]) do |p|
      p.hiragana = pref[:hiragana]
      p.katakana = pref[:katakana]
      p.alphabet = pref[:alphabet]
    end
  end
end

baseball_categories.each { |name| BaseballCategory.find_or_create_by!(name:) } if seed_type == 'baseball_categories'
