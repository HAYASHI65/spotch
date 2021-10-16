# アプリ名
## SPOTCH (読み方：スポッチ)
<br><br>

# 概要
指導者や協力者・参加者不足に悩む部活動や社会人クラブ・同好会・サークルといったスポーツチームと、運動不足を解消したい社会人経験者をマッチングするアプリです。（SPORTS × MATCHING = SPOTCH）
<br><br><br>

# 本番環境
http://3.114.4.150/
<br>
ID：admin<br>
PASS：2222
<br><br>
ログイン情報（テスト用）
<br>
【テスト用アカウント１】
* Eメール：test@gmail.com
* パスワード：test65
<br><br>

【テスト用アカウント２】
* Eメール：spo@gmail.com
<br>

* パスワード：spo111
<br><br>

クレジットカード登録情報（テスト用）
<br>

* クレジット番号：4242424242424242(16桁)

* cvc：123

* 有効期限：現在より未来
<br><br><br>

# 制作背景(意図)

このアプリを制作した理由は2つあります。<br>
### **①「指導者不足に悩む部活動のため」**
コロナ禍で外出自粛の感覚が根付き、それまで母校へ指導に来ていたOB・OGが来なくなってしまう現状を打破すべく、近隣に住むスポーツ経験者を誘致するサービスを作りたいと考えました。「もっと幅広い練習をして強くなりたい」と考える生徒にとって、外部の指導者との練習は技術的・精神的に刺激になり、学生スポーツのレベル向上にも貢献できるのではないかと考えました。また部活動に留まらず、参加者・協力者不足に悩む社会人クラブや同好会・サークル等のスポーツチームにも活用してもらうことができます。<br>

### **②「運動不足を解消したい社会人経験者のため」**
「最近運動不足気味だから、学生時代に打ち込んでいたスポーツをやりたい！しかしどこかのチームに所属してまでやるのは気が引ける…」という社会人経験者が、近隣のクラブチームや部活動などを気軽に検索できるアプリを作りたいと考えました。運動したいと思った時、体験参加のように気軽に参加できるシステムがあれば、運動不足の解消や新しいコミュニティの形成もでき、心身ともにリラックスできる社会に貢献できるのではないかと考えました。また社会人経験者の中には、学生時代に県大会上位入賞や、全国大会出場など華やかな実績を持つ人も多く、参加先のチームの活性化や刺激にも繋がります。<br>
上記2点の課題を解決しつつ、お互いにとって良い相乗効果を生むWEBサービスを実現したいと考え、SPOTCHを制作しました。
<br><br><br>

# DEMO

添付されているGIF動画は、開発段階のものです。
あらかじめご了承ください。

### **トップページ**
* ログインをしていなくても、誰でも閲覧することができます。
* ただしログインをしていない場合、ヘッダーの項目やトップページのボタン表示が切り替わります。
* ヘッダーと、右下のチーム検索アイコンは固定されています。

![top](https://user-images.githubusercontent.com/89055880/136523583-4df5a9a8-e356-43b6-9eb5-1cb4a413db85.gif)

<br>

### **ユーザー新規登録画面**
* ユーザーの個人情報(一般公開なし)と、プロフィール(一般公開あり)を入力してもらうことで、サービスが利用できるようになります。
* 一部グレーの注釈が付いている項目は、任意での入力です。
* 入力されたプロフィール情報はマイページから確認でき、同ページから入力情報の編集画面へ遷移することができます。
* 必須項目が未入力の場合、赤いエラーメッセージが日本語で表示されます。

![signup](https://user-images.githubusercontent.com/89055880/136524978-8dc4ff57-ecbe-4716-8cf8-6440a6fd2427.gif)

<br>

### **チーム新規投稿画面**
* 会員登録をしたユーザーのみ、自身が管理するチームを投稿することができます。
* 一部グレーの注釈が付いている項目は、任意での入力です。
* 入力されたチーム情報はチーム詳細画面から確認でき、同ページから入力情報の編集画面へ遷移することができます。
* 必須項目が未入力の場合、赤いエラーメッセージが日本語で表示されます。

![teamNew](https://user-images.githubusercontent.com/89055880/136534276-bedcf9ac-46c8-4508-a11f-8b05b2b07e7c.gif)

<br>

### **チーム検索画面**
* 自身の目的にマッチするチームを検索することができます。
* プルダウン形式のボックスから条件を絞り込むことができ、検索結果に表示されたチーム名をクリックすると、そのチームの詳細ページへ遷移することができます。

![search](https://user-images.githubusercontent.com/89055880/136525861-6bea688e-1623-4057-a683-f148bc67bf1b.gif)

<br>

### **チーム詳細画面①(お気に入り登録機能)**
* チーム詳細画面から、気になるチームをお気に入り登録できます。
* `ハートアイコン`をクリックすると、お気に入りの登録/削除が可能です。
* `ハートアイコン`の右下には、そのチームをお気に入りしたユーザー数がカウントされます。
* ヘッダーのお気に入りタブから、「自身がお気に入り登録したチーム」「自身が管理するチームをお気に入りしてくれたユーザー」を一覧で確認できます。
* 別ユーザーが管理するチームの場合のみ、`ハートアイコン`が表示されます。

![favorite](https://user-images.githubusercontent.com/89055880/136527637-6ae037f0-baf6-4ceb-b0de-88ff57a5e7a7.gif)

<br>

### **チーム詳細画面②(参加申請機能)**
* チーム詳細画面から、練習に参加したいチームへ応募できます。
* `このチームに応募する`をクリックすることで参加申請を送ることができ、もう一度クリックすると参加申請を取り消すことができます。
* 自身がどのチームに応募したかは、マイページから確認できます。
* 別ユーザーが管理するチームの場合のみ、`参加申請/取り消し`のボタンが表示されます。

![apply](https://user-images.githubusercontent.com/89055880/136528868-78172953-aa17-48b7-a094-2f2b1c9773a5.gif)

<br>

### **参加申請待ち一覧画面**
* チーム詳細画面から、参加申請待ち一覧画面へ遷移できます。
* 自身が管理するチームに参加申請中のユーザーに対して、`参加の承認`or`参加の却下`を選択します。
* 参加を承認した場合、同ページにてマッチングしたユーザーを確認できます。また申請していたユーザー側でも、マイページの`参加が承認されたチーム`から承認されたことを確認できます。
* 参加を却下した場合、参加申請待ち一覧画面からは削除されます。また申請していたユーザー側でも、マイページの`応募中のチーム一覧`からチーム名が削除されます。
* 自身が管理するチームの場合のみ、`参加申請待ち一覧ページ`のボタンが表示されます。

![applyCheck](https://user-images.githubusercontent.com/89055880/136529920-4b0108d0-af6e-41b7-83e3-6fe1e6857659.gif)

<br>

### **寄付画面**
* チーム詳細画面から、寄付画面へ遷移できます。
* 寄付金額を入力し、任意で応援メッセージを添えて寄付することができます。
* すでに自身と紐付くクレジットカードが登録されている場合、カード情報の再入力は必要ありません。
* クレジットカードが未登録の状態で`寄付する`ボタンをクリックした場合、クレジットカード登録画面へとリダイレクトされます。
* ヘッダーの寄付タブから、「自身が寄付したチーム」「自身が管理するチームに寄付してくれたユーザー」を一覧で確認できます。
* 別ユーザーが管理するチームの場合のみ、`このチームに寄付する`ボタンが表示されます。
![donation](https://user-images.githubusercontent.com/89055880/136529409-c8c1866a-2198-47bf-b665-9a226b001d7f.gif)

<br>

### **チャット画面**
* ユーザー詳細画面から、チャット画面へ遷移できます。
* メッセージを送信すると、メッセージ一覧が非同期で更新されます。
* LINEのように、送信したメッセージが下から更新されていくため、直感的に操作することができます。
* ヘッダーのチャットタブから、「自身とチャットをしたことがあるユーザー」を一覧で確認できます。
* 自分以外のユーザー詳細画面のみ、`チャットをする`ボタンが表示されます。

![chat](https://user-images.githubusercontent.com/89055880/136530435-51a73c2a-4f32-4d69-a996-907143f35a4a.gif)
<br><br><br>

# 工夫したポイント
* スマートフォンの規格に合わせたレスポンシブデザイン対応をしています。
* 「ユーザー詳細」「チーム詳細」の2ページは、ログイン中のユーザーと紐付くかどうかによって表示されるボタンが切り変わります。(ログインユーザーと紐付く場合は「編集する」ボタンが出るが、そうでない場合表示されない等)
* 気になるチームがあった際は「お気に入り」を付けることができます。また「自身がお気に入りしたチーム」だけでなく、「自身が管理するチームにお気に入りしてくれた人」も確認することができます。これにより、チーム管理者側から興味を持ってくれている人へアプローチすることが可能となります。
* 参加申請に関して「応募した」「応募された」の情報だけでなく、マッチングした際の情報も確認できるようにしました。例えばユーザー視点では、応募中のチームだけでなく「自身とSPOTCHしたチーム(自身の申請が承認されたチーム)」の情報を、チーム管理者視点では、応募されたユーザーだけでなく「自身のチームとSPOTCHしたユーザー(自身が申請を承認したユーザー)」の情報を確認できます。
* ユーザーと連絡を取り合いたい場合は、チャットルームで個別にやりとりができます。打ち込んだメッセージは下から非同期通信で更新され、LINEに近い操作感のため直感的に扱うことができます。
* クレジットカードを登録し、応援したいチームへ寄付をすることができます。一度カード登録をすればユーザーと紐付けられるため、カード情報の再入力をせずとも、どのチームに何回でも寄付することができます。また「自身が寄付したチーム」「自身のチームに寄付してくれた人」も確認できます。寄付機能を作った理由は、忙しくて参加できないOBや、TV放映をきっかけにファンになった人など、「コロナ禍で思うような練習や試合ができないチームのために、何か力になりたい！」と思う人達のエールを伝えることができるようにしたかったからです。
<br><br><br>

# 使用技術(開発環境)
### **バックエンド**
Ruby, Ruby on Rails
### **フロントエンド**
HTML, CSS, JavaScript, jQuery
### **データベース**
MySQL, SequelPro
### **インフラ**
AWS(EC2), Capistrano
<br><br>

# WEBサーバ(本番環境)
nginx
<br><br>

# アプリケーションサーバ(本番環境)
unicorn
<br><br>

# ソース管理
GitHub, GitHubDesktop
<br><br>

# テスト
RSpec
<br><br>

# エディタ
VSCode
<br><br><br>

# 課題や今後実装したい機能
* ユーザーブロック機能を設けることで、迷惑行為を行うユーザーとの関わりを阻止できるよう検討中です。
* 応募申請やお気に入りなど、自身が管理するチームへのアクションがあった場合に、通知される機能を検討しています。(Twitterのいいねのように、アクションの数だけ数字が表示されるイメージです)
* タブレット規格のレスポンシブデザインを実装予定です。
* ユーザーが客観的な評価を参考にできるよう、ユーザーとチームそれぞれへのレビュー機能実装を検討しています。またその評価を元に、地域別・スポーツ別のランキングを導入し、アプリケーションの活性化を図ることができればと考えています。
* 現状はエリアが東京都のみですが、神奈川県や千葉県など他のエリアへの展開も予定しています。
* アプリケーションを保守・管理していくための収益方法が検討段階にあり、「広告スペースを設ける」「寄付の仲介手数料として数％徴収する」「優先おすすめ表示や機能の拡充ができる有料会員の実装」など、現実的な収益化は模索中です。
<br><br><br>

# テーブル設計
<br>

## **usersテーブル**
<br>

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| gender_id             | integer    | null: false                    |
| birthday              | date       | null: false                    |
| nickname              | string     | null: false                    |
| sports_id             | integer    | null: false                    |
| active_area_id        | integer    | null: false                    |
| active_day_id         | integer    | null: false                    |
| active_time_id        | integer    | null: false                    |
| achievement_id        | integer    |                                |
| achievement_content   | text       |                                |
| profile               | text       |                                |

### Association

* has_many :teams
* has_many :favorites
* has_many :applies
* has_many :team_donations
* has_one :card
* has_many :user_rooms
* has_many :rooms, through: :user_rooms
* has_many :chats
<br><br>

## **teamsテーブル**
<br>

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| team_name             | string     | null: false                    |
| sports_id             | integer    | null: false                    |
| group_id              | integer    | null: false                    |
| active_area_id        | integer    | null: false                    |
| active_day_id         | integer    | null: false                    |
| active_time_id        | integer    | null: false                    |
| place                 | text       | null: false                    |
| gender_ratio          | string     | null: false                    |
| level_id              | integer    | null: false                    |
| profile               | text       |                                |
| user                  | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_many :favorites
* has_many :applies
* has_many :team_donations
<br><br>

## **favoritesテーブル**
<br>

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |

### Association

* belongs_to user
* belongs_to :team
<br><br>

## **appliesテーブル**
<br>

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :team
<br><br>

## **cardsテーブル**
<br>

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| customer_token        | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
* belongs_to :user
<br><br>

## **team_donationsテーブル**

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| team                  | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :team
* has_one :donation
<br><br>

## **donationsテーブル**
<br>

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| price                 | integer    | null: false                    |
| text                  | text       |                                |
| team_donation         | references | null: false, foreign_key: true |

### Association
* belongs_to :team_donation
<br><br>

## **rooms テーブル**
<br>

| Column | Type   | Options     |
| ------ | ------ | ----------- |

### Association
* has_many :users, through: :user_rooms
* has_many :user_rooms
* has_many :chats
<br><br>

## **user_rooms テーブル**

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :room
<br><br>

## **chats テーブル**
<br>

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :room
