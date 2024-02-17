seed_type = ENV.fetch('SEED_TYPE', nil)
Rails.logger.debug { "Seed type: #{seed_type}" }

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

prefectures1 = [
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
  { name: '長野県', hiragana: 'ながのけん', katakana: 'ナガノケン', alphabet: 'Nagano' }
]

prefectures2 = [
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
  { name: '徳島県', hiragana: 'とくしまけん', katakana: 'トクシマケン', alphabet: 'Tokushima' }
]

prefectures3 = [
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
  { name: '沖縄県', hiragana: 'おきなわけん', katakana: 'オキナワケン', alphabet: 'Okinawa' },
  { name: 'その他', hiragana: 'そのた', katakana: 'ソノタ', alphabet: 'Sonota' }
]

baseballcategories1 = [
  { name: '小学生（硬式）', hiragana: 'しょうがくせい（こうしき）', katakana: 'ショウガクセイ（コウシキ）', alphabet: 'Shogakusei (Koushiki)' },
  { name: '小学生（軟式）', hiragana: 'しょうがくせい（なんしき）', katakana: 'ショウガクセイ（ナンシキ）', alphabet: 'Shogakusei (Nanshiki)' },
  { name: 'ボーイズリーグ（中学生）', hiragana: 'ぼーいずりーぐ（ちゅうがくせいのぶ）', katakana: 'ボーイズリーグ（チュウガクセイ）', alphabet: 'Boys League (Chuugakusei)' },
  { name: 'リトルシニアリーグ（中学生）', hiragana: 'りとるしにありーぐ（ちゅうがくせいのぶ）', katakana: 'リトルシニアリーグ（チュウガクセイ）', alphabet: 'Little Senior League (Chuugakusei)' },
  { name: 'ヤングリーグ（中学生）', hiragana: 'やんぐりーぐ（ちゅうがくせいのぶ）', katakana: 'ヤングリーグ（チュウガクセイ）', alphabet: 'Young League (Chuugakusei)' },
  { name: 'ポニーリーグ（中学生）', hiragana: 'ぽにーりーぐ（ちゅうがくせいのぶ）', katakana: 'ポニーリーグ（チュウガクセイ）', alphabet: 'Pony League (Chuugakusei)' },
  { name: 'プロンコリーグ（中学生）', hiragana: 'ぷろんこりーぐ（ちゅうがくせいのぶ）', katakana: 'プロンコリーグ（チュウガクセイ）', alphabet: 'Bronco League (Chuugakusei)' },
  { name: 'フレッシュリーグ（中学生）', hiragana: 'ふれっしゅりーぐ（ちゅうがくせいのぶ）', katakana: 'フレッシュリーグ（チュウガクセイ）', alphabet: 'Fresh League (Chuugakusei)' },
  { name: 'ジャパンリーグ（中学生）', hiragana: 'じゃぱんりーぐ', katakana: 'ジャパンリーグ', alphabet: 'Japan League' },
  { name: '中学（軟式）', hiragana: 'ちゅうがく（なんしき）', katakana: 'チュウガク（ナンシキ）', alphabet: 'Chugaku (Nanshiki)' },
  { name: '高校（硬式）', hiragana: 'こうこう（こうしき）', katakana: 'コウコウ（コウシキ）', alphabet: 'Koukou (Koushiki)' },
  { name: '高校（軟式）', hiragana: 'こうこう（なんしき）', katakana: 'コウコウ（ナンシキ）', alphabet: 'Koukou (Nanshiki)' }
]

baseballcategories2 = [
  { name: '北海道学生野球連盟（大学硬式）', hiragana: 'ほっかいどうがくせいやきゅうれんめい（だいがくこうしき）', katakana: 'ホッカイドウガクセイヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Hokkaido Gakusei Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '札幌学生野球連盟（大学硬式）', hiragana: 'さっぽろがくせいやきゅうれんめい（だいがくこうしき）', katakana: 'サッポログクセイヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Sapporo Gakusei Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '北東北大学野球連盟（大学硬式）', hiragana: 'きたとうほくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'キタトウホクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kita Tohoku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '仙台六大学野球連盟（大学硬式）', hiragana: 'せんだいろくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'センダイロクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Sendai Roku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '南東北大学野球連盟（大学硬式）', hiragana: 'みなみとうほくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'ミナミトウホクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Minami Tohoku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '千葉県大学野球連盟（大学硬式）', hiragana: 'ちばけんだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'チバケンダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Chiba Ken Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '関甲新学生野球連盟（大学硬式）', hiragana: 'かんこうしんがくせいやきゅうれんめい（だいがくこうしき）', katakana: 'カンコウシンガクセイヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kankou Shin Gakusei Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '東京新大学野球連盟（大学硬式）', hiragana: 'とうきょうしんだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'トウキョウシンダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Tokyo Shin Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '東京六大学野球連盟（大学硬式）', hiragana: 'とうきょうろくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'トウキョウロクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Tokyo Roku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '東都大学野球連盟（大学硬式）', hiragana: 'とうとだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'トウトダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Touto Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '首都大学野球連盟（大学硬式）', hiragana: 'しゅとだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'シュトダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Shuto Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '神奈川大学野球連盟（大学硬式）', hiragana: 'かながわだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'カナガワダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kanagawa Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '愛知大学野球連盟（大学硬式）', hiragana: 'あいちだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'アイチダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Aichi Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '東海地区大学野球連盟（大学硬式）', hiragana: 'とうかいちくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'トウカイチクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Tokai Chiku Daigaku Yakyuu Renmei (Daigaku Koushiki)' }
]

baseballcategories3 = [
  { name: '北陸大学野球連盟（大学硬式）', hiragana: 'ほくりくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'ホクリクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Hokuriku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '関西学生野球連盟（大学硬式）', hiragana: 'かんさいがくせいやきゅうれんめい（だいがくこうしき）', katakana: 'カンサイガクセイヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kansai Gakusei Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '関西六大学野球連盟（大学硬式）', hiragana: 'かんさいろくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'カンサイロクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kansai Roku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '阪神大学野球連盟（大学硬式）', hiragana: 'はんしんだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'ハンシンダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Hanshin Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '近畿学生野球連盟（大学硬式）', hiragana: 'きんきがくせいやきゅうれんめい（だいがくこうしき）', katakana: 'キンキガクセイヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kinki Gakusei Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '京滋大学野球連盟（大学硬式）', hiragana: 'けいじだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'ケイジダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Keiji Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '広島六大学野球連盟（大学硬式）', hiragana: 'ひろしまろくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'ヒロシマロクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Hiroshima Roku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '中国地区大学野球連盟（大学硬式）', hiragana: 'ちゅうごくちくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'チュウゴクチクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Chugoku Chiku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '四国地区大学野球連盟（大学硬式）', hiragana: 'しこくちくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'シコクチクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Shikoku Chiku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '九州六大学野球連盟（大学硬式）', hiragana: 'きゅうしゅうろくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'キュウシュウロクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kyushu Roku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '福岡六大学野球連盟（大学硬式）', hiragana: 'ふくおかろくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'フクオカロクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Fukuoka Roku Daigaku Yakyuu Renmei (Daigaku Koushiki)' },
  { name: '九州地区大学野球連盟（大学硬式）', hiragana: 'きゅうしゅうちくだいがくやきゅうれんめい（だいがくこうしき）', katakana: 'キュウシュウチクダイガクヤキュウレンメイ（ダイガクコウシキ）',
    alphabet: 'Kyushu Chiku Daigaku Yakyuu Renmei (Daigaku Koushiki)' }
]

baseballcategories4 = [
  { name: '北海道地区大学軟式野球連盟（大学軟式）', hiragana: 'ほっかいどうちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'ホッカイドウチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Hokkaido Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '奥羽地区大学軟式野球連盟（大学軟式）', hiragana: 'おううちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'オウウチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Ouu Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '東北地区大学軟式野球連盟（大学軟式）', hiragana: 'とうほくちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'トウホクチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Touhoku Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '北関東大学軟式野球連盟（大学軟式）', hiragana: 'きたかんとうだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'キタカントウダイガクナンシキヤキュウレンメイ',
    alphabet: 'Kita Kanto Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '東京六大学軟式野球連盟（大学軟式）', hiragana: 'とうきょうろくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'トウキョウロクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Tokyo Roku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '東都大学軟式野球連盟（大学軟式）', hiragana: 'とうとだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'トウトダイガクナンシキヤキュウレンメイ',
    alphabet: 'Touto Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '首都大学軟式野球連盟（大学軟式）', hiragana: 'しゅとだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'シュトダイガクナンシキヤキュウレンメイ',
    alphabet: 'Shuto Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '東関東大学軟式野球連盟（大学軟式）', hiragana: 'とうかんとうだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'トウカントウダイガクナンシキヤキュウレンメイ',
    alphabet: 'Tou Kanto Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '南関東大学軟式野球連盟（大学軟式）', hiragana: 'みなみかんとうだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'ミナミカントウダイガクナンシキヤキュウレンメイ',
    alphabet: 'Minami Kanto Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '関東新大学軟式野球連盟（大学軟式）', hiragana: 'かんとうしんだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'カントウシンダイガクナンシキヤキュウレンメイ',
    alphabet: 'Kanto Shin Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '東京新大学軟式野球連盟（大学軟式）', hiragana: 'とうきょうしんだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'トウキョウシンダイガクナンシキヤキュウレンメイ',
    alphabet: 'Tokyo Shin Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '東海学生軟式野球連盟（大学軟式）', hiragana: 'とうかいがくせいなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'トウカイガクセイナンシキヤキュウレンメイ',
    alphabet: 'Tokai Gakusei Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '長野県大学軟式野球連盟（大学軟式）', hiragana: 'ながのけんだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'ナガノケンダイガクナンシキヤキュウレンメイ',
    alphabet: 'Nagano Ken Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '新潟地区大学軟式野球連盟（大学軟式）', hiragana: 'にいがたちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'ニイガタチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Niigata Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' }
]

baseballcategories5 = [
  { name: '北陸地区大学軟式野球連盟（大学軟式）', hiragana: 'ほくりくちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'ホクリクチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Hokuriku Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '近畿学生軟式野球連盟（大学軟式）', hiragana: 'きんきがくせいなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'キンキガクセイナンシキヤキュウレンメイ',
    alphabet: 'Kinki Gakusei Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '関西六大学軟式野球連盟（大学軟式）', hiragana: 'かんさいろくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'カンサイロクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Kansai Roku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '西都大学軟式野球連盟（大学軟式）', hiragana: 'せいとだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'セイトダイガクナンシキヤキュウレンメイ',
    alphabet: 'Seito Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '京滋大学軟式野球連盟（大学軟式）', hiragana: 'けいじだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'ケイジダイガクナンシキヤキュウレンメイ',
    alphabet: 'Keiji Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '中国地区大学軟式野球連盟（大学軟式）', hiragana: 'ちゅうごくちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'チュウゴクチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Chugoku Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '四国地区大学軟式野球連盟（大学軟式）', hiragana: 'しこくちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'シコクチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Shikoku Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '九州地区大学軟式野球連盟（大学軟式）', hiragana: 'きゅうしゅうちくだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'キュウシュウチクダイガクナンシキヤキュウレンメイ',
    alphabet: 'Kyushu Chiku Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' },
  { name: '沖縄県大学軟式野球連盟（大学軟式）', hiragana: 'おきなわけんだいがくなんしきやきゅうれんめい（だいがくなんしき）', katakana: 'オキナワケンダイガクナンシキヤキュウレンメイ',
    alphabet: 'Okinawa Ken Daigaku Nanshiki Yakyuu Renmei (Daigaku Nanshiki)' }
]

baseballcategories6 = [
  { name: '北海道地区（JABA）', hiragana: 'ほっかいどうちく（JABA）', katakana: 'ホッカイドウチク（JABA）', alphabet: 'Hokkaido Chiku (JABA)' },
  { name: '東北地区（JABA）', hiragana: 'とうほくちく（JABA）', katakana: 'トウホクチク（JABA）', alphabet: 'Tohoku Chiku (JABA)' },
  { name: '北信越地区（JABA）', hiragana: 'ほくしんえつちく（JABA）', katakana: 'ホクシンエツチク（JABA）', alphabet: 'Hokushin' },
  { name: '北関東地区（JABA）', hiragana: 'きたかんとうちく（JABA）', katakana: 'ホクカントウチク（JABA）', alphabet: 'Hokkanto Chiku (JABA)' },
  { name: '南関東地区（JABA）', hiragana: 'みなみかんとうちく（JABA）', katakana: 'ミナミカントウチク（JABA）', alphabet: 'Minamikanto Chiku (JABA)' },
  { name: '東京地区（JABA）', hiragana: 'とうきょうちく（JABA）', katakana: 'トウキョウチク（JABA）', alphabet: 'Tokyo Chiku (JABA)' },
  { name: '西関東地区（JABA）', hiragana: 'にしがんとうちく（JABA）', katakana: 'ニシカントウチク（JABA）', alphabet: 'Nishikanto Chiku (JABA)' },
  { name: '東海地区（JABA）', hiragana: 'とうかいちく（JABA）', katakana: 'トウカイチク（JABA）', alphabet: 'Tokai Chiku (JABA)' },
  { name: '近畿地区（JABA）', hiragana: 'きんきちく（JABA）', katakana: 'キンキチク（JABA）', alphabet: 'Kinki Chiku (JABA)' },
  { name: '中国地区（JABA）', hiragana: 'ちゅうごくちく（JABA）', katakana: 'チュウゴクチク（JABA）', alphabet: 'Chugoku Chiku (JABA)' },
  { name: '四国地区（JABA）', hiragana: 'しこくちく（JABA）', katakana: 'シコクチク（JABA）', alphabet: 'Shikoku Chiku (JABA)' },
  { name: '九州地区（JABA）', hiragana: 'きゅうしゅうちく（JABA）', katakana: 'キュウシュウチク（JABA）', alphabet: 'Kyushu Chiku (JABA)' }
]

Position.create(positions) if seed_type == 'positions'

selected_prefectures = case seed_type
                       when 'prefectures1'
                         prefectures1
                       when 'prefectures2'
                         prefectures2
                       when 'prefectures3'
                         prefectures3
                       else
                         raise ArgumentError, "Invalid seed type: #{seed_type}"
                       end

selected_prefectures.each do |pref|
  Prefecture.find_or_create_by!(name: pref[:name]) do |p|
    p.hiragana = pref[:hiragana]
    p.katakana = pref[:katakana]
    p.alphabet = pref[:alphabet]
  end
end

selected_categories = case seed_type
                      when 'baseballcategories1'
                        baseballcategories1
                      when 'baseballcategories2'
                        baseballcategories2
                      when 'baseballcategories3'
                        baseballcategories3
                      when 'baseballcategories4'
                        baseballcategories4
                      when 'baseballcategories5'
                        baseballcategories5
                      when 'baseballcategories6'
                        baseballcategories6
                      else
                        raise ArgumentError, "Invalid seed type: #{seed_type}"
                      end

selected_categories.each do |category|
  BaseballCategory.find_or_create_by!(name: category[:name]) do |cat|
    cat.hiragana = category[:hiragana]
    cat.katakana = category[:katakana]
    cat.alphabet = category[:alphabet]
  end
end
