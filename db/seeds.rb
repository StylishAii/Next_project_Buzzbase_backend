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
  { name: '小学生（硬式）', hiragana: 'しょうがくせい（こうしき）', katakana: 'ショウガクセイ（コウシキ）', alphabet: 'Shogakusei (Koushiki)' },
  { name: '小学生（軟式）', hiragana: 'しょうがくせい（なんしき）', katakana: 'ショウガクセイ（ナンシキ）', alphabet: 'Shogakusei (Nanshiki)' },
  { name: 'ボーイズリーグ（中学生の部）', hiragana: 'ぼーいずりーぐ（ちゅうがくせいのぶ）', katakana: 'ボーイズリーグ（チュウガクセイノブ）', alphabet: 'Boys League (Chuugakusei no Bu)' },
  { name: 'リトルシニアリーグ', hiragana: 'りとるしにありーぐ', katakana: 'リトルシニアリーグ', alphabet: 'Little Senior League' },
  { name: 'ヤングリーグ', hiragana: 'やんぐりーぐ', katakana: 'ヤングリーグ', alphabet: 'Young League' },
  { name: 'ポニーリーグ', hiragana: 'ぽにーりーぐ', katakana: 'ポニーリーグ', alphabet: 'Pony League' },
  { name: 'プロンコリーグ', hiragana: 'ぷろんこりーぐ', katakana: 'プロンコリーグ', alphabet: 'Bronco League' },
  { name: 'フレッシュリーグ', hiragana: 'ふれっしゅりーぐ', katakana: 'フレッシュリーグ', alphabet: 'Fresh League' },
  { name: 'ジャパンリーグ', hiragana: 'じゃぱんりーぐ', katakana: 'ジャパンリーグ', alphabet: 'Japan League' },
  { name: '中学（軟式）', hiragana: 'ちゅうがく（なんしき）', katakana: 'チュウガク（ナンシキ）', alphabet: 'Chugaku (Nanshiki)' },
  { name: '高校（硬式）', hiragana: 'こうこう（こうしき）', katakana: 'コウコウ（コウシキ）', alphabet: 'Koukou (Koushiki)' },
  { name: '高校（軟式）', hiragana: 'こうこう（なんしき）', katakana: 'コウコウ（ナンシキ）', alphabet: 'Koukou (Nanshiki)' },
  # 大学硬式
  { name: '北海道学生野球連盟', hiragana: 'ほっかいどうがくせいやきゅうれんめい', katakana: 'ホッカイドウガクセイヤキュウレンメイ', alphabet: 'Hokkaido Gakusei Yakyuu Renmei' },
  { name: '札幌学生野球連盟', hiragana: 'さっぽろがくせいやきゅうれんめい', katakana: 'サッポログクセイヤキュウレンメイ', alphabet: 'Sapporo Gakusei Yakyuu Renmei' },
  { name: '北東北大学野球連盟', hiragana: 'きたとうほくだいがくやきゅうれんめい', katakana: 'キタトウホクダイガクヤキュウレンメイ', alphabet: 'Kita Tohoku Daigaku Yakyuu Renmei' },
  { name: '仙台六大学野球連盟', hiragana: 'せんだいろくだいがくやきゅうれんめい', katakana: 'センダイロクダイガクヤキュウレンメイ', alphabet: 'Sendai Roku Daigaku Yakyuu Renmei' },
  { name: '南東北大学野球連盟', hiragana: 'みなみとうほくだいがくやきゅうれんめい', katakana: 'ミナミトウホクダイガクヤキュウレンメイ', alphabet: 'Minami Tohoku Daigaku Yakyuu Renmei' },
  { name: '千葉県大学野球連盟', hiragana: 'ちばけんだいがくやきゅうれんめい', katakana: 'チバケンダイガクヤキュウレンメイ', alphabet: 'Chiba Ken Daigaku Yakyuu Renmei' },
  { name: '関甲新学生野球連盟', hiragana: 'かんこうしんがくせいやきゅうれんめい', katakana: 'カンコウシンガクセイヤキュウレンメイ', alphabet: 'Kankou Shin Gakusei Yakyuu Renmei' },
  { name: '東京新大学野球連盟', hiragana: 'とうきょうしんだいがくやきゅうれんめい', katakana: 'トウキョウシンダイガクヤキュウレンメイ', alphabet: 'Tokyo Shin Daigaku Yakyuu Renmei' },
  { name: '東京六大学野球連盟', hiragana: 'とうきょうろくだいがくやきゅうれんめい', katakana: 'トウキョウロクダイガクヤキュウレンメイ', alphabet: 'Tokyo Roku Daigaku Yakyuu Renmei' },
  { name: '東都大学野球連盟', hiragana: 'とうとだいがくやきゅうれんめい', katakana: 'トウトダイガクヤキュウレンメイ', alphabet: 'Touto Daigaku Yakyuu Renmei' },
  { name: '首都大学野球連盟', hiragana: 'しゅとだいがくやきゅうれんめい', katakana: 'シュトダイガクヤキュウレンメイ', alphabet: 'Shuto Daigaku Yakyuu Renmei' },
  { name: '神奈川大学野球連盟', hiragana: 'かながわだいがくやきゅうれんめい', katakana: 'カナガワダイガクヤキュウレンメイ', alphabet: 'Kanagawa Daigaku Yakyuu Renmei' },
  { name: '愛知大学野球連盟', hiragana: 'あいちだいがくやきゅうれんめい', katakana: 'アイチダイガクヤキュウレンメイ', alphabet: 'Aichi Daigaku Yakyuu Renmei' },
  { name: '東海地区大学野球連盟', hiragana: 'とうかいちくだいがくやきゅうれんめい', katakana: 'トウカイチクダイガクヤキュウレンメイ', alphabet: 'Tokai Chiku Daigaku Yakyuu Renmei' },
  { name: '北陸大学野球連盟', hiragana: 'ほくりくだいがくやきゅうれんめい', katakana: 'ホクリクダイガクヤキュウレンメイ', alphabet: 'Hokuriku Daigaku Yakyuu Renmei' },
  { name: '関西学生野球連盟', hiragana: 'かんさいがくせいやきゅうれんめい', katakana: 'カンサイガクセイヤキュウレンメイ', alphabet: 'Kansai Gakusei Yakyuu Renmei' },
  { name: '関西六大学野球連盟', hiragana: 'かんさいろくだいがくやきゅうれんめい', katakana: 'カンサイロクダイガクヤキュウレンメイ', alphabet: 'Kansai Roku Daigaku Yakyuu Renmei' },
  { name: '阪神大学野球連盟', hiragana: 'はんしんだいがくやきゅうれんめい', katakana: 'ハンシンダイガクヤキュウレンメイ', alphabet: 'Hanshin Daigaku Yakyuu Renmei' },
  { name: '近畿学生野球連盟', hiragana: 'きんきがくせいやきゅうれんめい', katakana: 'キンキガクセイヤキュウレンメイ', alphabet: 'Kinki Gakusei Yakyuu Renmei' },
  { name: '京滋大学野球連盟', hiragana: 'けいじだいがくやきゅうれんめい', katakana: 'ケイジダイガクヤキュウレンメイ', alphabet: 'Keiji Daigaku Yakyuu Renmei' },
  { name: '広島六大学野球連盟', hiragana: 'ひろしまろくだいがくやきゅうれんめい', katakana: 'ヒロシマロクダイガクヤキュウレンメイ', alphabet: 'Hiroshima Roku Daigaku Yakyuu Renmei' },
  { name: '中国地区大学野球連盟', hiragana: 'ちゅうごくちくだいがくやきゅうれんめい', katakana: 'チュウゴクチクダイガクヤキュウレンメイ', alphabet: 'Chugoku Chiku Daigaku Yakyuu Renmei' },
  { name: '四国地区大学野球連盟', hiragana: 'しこくちくだいがくやきゅうれんめい', katakana: 'シコクチクダイガクヤキュウレンメイ', alphabet: 'Shikoku Chiku Daigaku Yakyuu Renmei' },
  { name: '九州六大学野球連盟', hiragana: 'きゅうしゅうろくだいがくやきゅうれんめい', katakana: 'キュウシュウロクダイガクヤキュウレンメイ', alphabet: 'Kyushu Roku Daigaku Yakyuu Renmei' },
  { name: '福岡六大学野球連盟', hiragana: 'ふくおかろくだいがくやきゅうれんめい', katakana: 'フクオカロクダイガクヤキュウレンメイ', alphabet: 'Fukuoka Roku Daigaku Yakyuu Renmei' },
  { name: '九州地区大学野球連盟', hiragana: 'きゅうしゅうちくだいがくやきゅうれんめい', katakana: 'キュウシュウチクダイガクヤキュウレンメイ', alphabet: 'Kyushu Chiku Daigaku Yakyuu Renmei' },
  # 大学軟式
  { name: '北海道地区大学軟式野球連盟', hiragana: 'ほっかいどうちくだいがくなんしきやきゅうれんめい', katakana: 'ホッカイドウチクダイガクナンシキヤキュウレンメイ', alphabet: 'Hokkaido Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '奥羽地区大学軟式野球連盟', hiragana: 'おううちくだいがくなんしきやきゅうれんめい', katakana: 'オウウチクダイガクナンシキヤキュウレンメイ', alphabet: 'Ouu Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '東北地区大学軟式野球連盟', hiragana: 'とうほくちくだいがくなんしきやきゅうれんめい', katakana: 'トウホクチクダイガクナンシキヤキュウレンメイ', alphabet: 'Touhoku Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '北関東大学軟式野球連盟', hiragana: 'きたかんとうだいがくなんしきやきゅうれんめい', katakana: 'キタカントウダイガクナンシキヤキュウレンメイ', alphabet: 'Kita Kanto Daigaku Nanshiki Yakyuu Renmei' },
  { name: '東京六大学軟式野球連盟', hiragana: 'とうきょうろくだいがくなんしきやきゅうれんめい', katakana: 'トウキョウロクダイガクナンシキヤキュウレンメイ', alphabet: 'Tokyo Roku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '東都大学軟式野球連盟', hiragana: 'とうとだいがくなんしきやきゅうれんめい', katakana: 'トウトダイガクナンシキヤキュウレンメイ', alphabet: 'Touto Daigaku Nanshiki Yakyuu Renmei' },
  { name: '首都大学軟式野球連盟', hiragana: 'しゅとだいがくなんしきやきゅうれんめい', katakana: 'シュトダイガクナンシキヤキュウレンメイ', alphabet: 'Shuto Daigaku Nanshiki Yakyuu Renmei' },
  { name: '東関東大学軟式野球連盟', hiragana: 'とうかんとうだいがくなんしきやきゅうれんめい', katakana: 'トウカントウダイガクナンシキヤキュウレンメイ', alphabet: 'Tou Kanto Daigaku Nanshiki Yakyuu Renmei' },
  { name: '南関東大学軟式野球連盟', hiragana: 'みなみかんとうだいがくなんしきやきゅうれんめい', katakana: 'ミナミカントウダイガクナンシキヤキュウレンメイ', alphabet: 'Minami Kanto Daigaku Nanshiki Yakyuu Renmei' },
  { name: '関東新大学軟式野球連盟', hiragana: 'かんとうしんだいがくなんしきやきゅうれんめい', katakana: 'カントウシンダイガクナンシキヤキュウレンメイ', alphabet: 'Kanto Shin Daigaku Nanshiki Yakyuu Renmei' },
  { name: '東京新大学軟式野球連盟', hiragana: 'とうきょうしんだいがくなんしきやきゅうれんめい', katakana: 'トウキョウシンダイガクナンシキヤキュウレンメイ', alphabet: 'Tokyo Shin Daigaku Nanshiki Yakyuu Renmei' },
  { name: '東海学生軟式野球連盟', hiragana: 'とうかいがくせいなんしきやきゅうれんめい', katakana: 'トウカイガクセイナンシキヤキュウレンメイ', alphabet: 'Tokai Gakusei Nanshiki Yakyuu Renmei' },
  { name: '長野県大学軟式野球連盟', hiragana: 'ながのけんだいがくなんしきやきゅうれんめい', katakana: 'ナガノケンダイガクナンシキヤキュウレンメイ', alphabet: 'Nagano Ken Daigaku Nanshiki Yakyuu Renmei' },
  { name: '新潟地区大学軟式野球連盟', hiragana: 'にいがたちくだいがくなんしきやきゅうれんめい', katakana: 'ニイガタチクダイガクナンシキヤキュウレンメイ', alphabet: 'Niigata Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '北陸地区大学軟式野球連盟', hiragana: 'ほくりくちくだいがくなんしきやきゅうれんめい', katakana: 'ホクリクチクダイガクナンシキヤキュウレンメイ', alphabet: 'Hokuriku Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '近畿学生軟式野球連盟', hiragana: 'きんきがくせいなんしきやきゅうれんめい', katakana: 'キンキガクセイナンシキヤキュウレンメイ', alphabet: 'Kinki Gakusei Nanshiki Yakyuu Renmei' },
  { name: '関西六大学軟式野球連盟', hiragana: 'かんさいろくだいがくなんしきやきゅうれんめい', katakana: 'カンサイロクダイガクナンシキヤキュウレンメイ', alphabet: 'Kansai Roku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '西都大学軟式野球連盟', hiragana: 'せいとだいがくなんしきやきゅうれんめい', katakana: 'セイトダイガクナンシキヤキュウレンメイ', alphabet: 'Seito Daigaku Nanshiki Yakyuu Renmei' },
  { name: '京滋大学軟式野球連盟', hiragana: 'けいじだいがくなんしきやきゅうれんめい', katakana: 'ケイジダイガクナンシキヤキュウレンメイ', alphabet: 'Keiji Daigaku Nanshiki Yakyuu Renmei' },
  { name: '中国地区大学軟式野球連盟', hiragana: 'ちゅうごくちくだいがくなんしきやきゅうれんめい', katakana: 'チュウゴクチクダイガクナンシキヤキュウレンメイ', alphabet: 'Chugoku Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '四国地区大学軟式野球連盟', hiragana: 'しこくちくだいがくなんしきやきゅうれんめい', katakana: 'シコクチクダイガクナンシキヤキュウレンメイ', alphabet: 'Shikoku Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '九州地区大学軟式野球連盟', hiragana: 'きゅうしゅうちくだいがくなんしきやきゅうれんめい', katakana: 'キュウシュウチクダイガクナンシキヤキュウレンメイ', alphabet: 'Kyushu Chiku Daigaku Nanshiki Yakyuu Renmei' },
  { name: '沖縄県大学軟式野球連盟', hiragana: 'おきなわけんだいがくなんしきやきゅうれんめい', katakana: 'オキナワケンダイガクナンシキヤキュウレンメイ', alphabet: 'Okinawa Ken Daigaku Nanshiki Yakyuu Renmei' },
  # JABA
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
  { name: '九州地区（JABA）', hiragana: 'きゅうしゅうちく（JABA）', katakana: 'キュウシュウチク（JABA）', alphabet: 'Kyushu Chiku (JABA)' },
  # 独立リーグ
  { name: '四国アイランドリーグplus', hiragana: 'しこくあいらんどりーぐぷらす', katakana: 'シコクアイランドリーグプラス', alphabet: 'Shikoku Island League Plus' },
  { name: 'ルートインBCリーグ', hiragana: 'るーといんびーしーりーぐ', katakana: 'ルートインBCリーグ', alphabet: 'Route Inn BC League' },
  { name: '九州アジアリーグ', hiragana: 'きゅうしゅうあじありーぐ', katakana: 'キュウシュウアジアリーグ', alphabet: 'Kyushu Asia League' },
  { name: '北海道フロンティアリーグ', hiragana: 'ほっかいどうふろんてぃありーぐ', katakana: 'ホッカイドウフロンティアリーグ', alphabet: 'Hokkaido Frontier League' },
  { name: '日本海リーグ', hiragana: 'にほんかいりーぐ', katakana: 'ニホンカイリーグ', alphabet: 'Nihonkai League' },
  { name: 'さわかみ関西独立リーグ', hiragana: 'さわかみかんさいどくりつりーぐ', katakana: 'サワカミカンサイドクリツリーグ', alphabet: 'Sawakami Kansai Independent League' },
  { name: '北海道ベースボールリーグ', hiragana: 'ほっかいどうべーすぼーるりーぐ', katakana: 'ホッカイドウベースボールリーグ', alphabet: 'Hokkaido Baseball League' },
  { name: '日本海オセアンリーグ', hiragana: 'にほんかいおせあんりーぐ', katakana: 'ニホンカイオセアンリーグ', alphabet: 'Nihonkai Ocean League' },
  # 社会人軟式
  { name: '社会人（軟式）', hiragana: 'しゃかいじん（なんしき）', katakana: 'シャカイジン（ナンシキ）', alphabet: 'Shakaijin (Nanshiki)' },
  # 女子野球
  { name: '女子中学（硬式）', hiragana: 'じょしちゅうがく（こうしき）', katakana: 'ジョシチュウガク（コウシキ）', alphabet: 'Joshichugaku (Koshiki)' },
  { name: '女子高校（硬式）', hiragana: 'じょしこうこう（こうしき）', katakana: 'ジョシコウコウ（コウシキ）', alphabet: 'Joshikoko (Koshiki)' },
  { name: '女子大学（硬式）', hiragana: 'じょしだいがく（こうしき）', katakana: 'ジョシダイガク（コウシキ）', alphabet: 'Joshidaigaku (Koshiki)' },
  { name: '女子企業・クラブ（硬式）', hiragana: 'じょしきぎょう・くらぶ（こうしき）', katakana: 'ジョシキギョウ・クラブ（コウシキ）', alphabet: 'Joshikigyo Club (Koshiki)' }
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

if seed_type == 'baseball_categories'
  baseball_categories.each do |pref|
    BaseballCategory.find_or_create_by!(name: pref[:name]) do |p|
      p.hiragana = pref[:hiragana]
      p.katakana = pref[:katakana]
      p.alphabet = pref[:alphabet]
    end
  end
end
