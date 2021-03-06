class Sports < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アーチェリー' },
    { id: 3, name: 'アーティスティックスイミング' },
    { id: 4, name: 'ウエイトリフティング' },
    { id: 5, name: 'カヌー(スプリント)' },
    { id: 6, name: 'カヌー(スローラム)' },
    { id: 7, name: '空手' },
    { id: 8, name: '競泳' },
    { id: 9, name: '近代五種' },
    { id: 10, name: 'ゴルフ' },
    { id: 11, name: 'サーフィン' },
    { id: 12, name: 'サッカー' },
    { id: 13, name: 'ソフトボール' },
    { id: 14, name: 'ラグビー' },
    { id: 15, name: '自転車競技(トラック)' },
    { id: 16, name: '自転車競技(BMXフリースタイル)' },
    { id: 17, name: '自転車競技(BMXレーシング)' },
    { id: 18, name: '自転車競技(ロード)' },
    { id: 19, name: '自転車競技(マウンテンバイク)' },
    { id: 20, name: '射撃' },
    { id: 21, name: '柔道' },
    { id: 22, name: '新体操' },
    { id: 23, name: '水球' },
    { id: 24, name: 'スケートボード' },
    { id: 25, name: 'スポーツクライミング' },
    { id: 26, name: '3x3バスケットボール' },
    { id: 27, name: 'セーリング' },
    { id: 28, name: '体操競技' },
    { id: 29, name: '卓球' },
    { id: 30, name: 'テコンドー' },
    { id: 31, name: 'テニス' },
    { id: 32, name: '飛込' },
    { id: 33, name: 'トライアスロン' },
    { id: 34, name: 'トランポリン' },
    { id: 35, name: '馬術' },
    { id: 36, name: 'バスケットボール' },
    { id: 37, name: 'バドミントン' },
    { id: 38, name: 'バレーボール' },
    { id: 39, name: 'ハンドボール' },
    { id: 40, name: 'ビーチバレーボール' },
    { id: 41, name: 'フェンシング' },
    { id: 42, name: 'ボート' },
    { id: 43, name: 'ボクシング' },
    { id: 44, name: 'ホッケー' },
    { id: 45, name: 'マラソンスイミング' },
    { id: 46, name: '野球' },
    { id: 47, name: '陸上競技' },
    { id: 48, name: 'レスリング' },
    { id: 49, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :teams
end
