# アプリケーション名
cluster_board

# アプリケーション概要
  メタバースサービスの一つのclusterというアプリ内で、何かの目的に応じて仲間を募集する掲示板アプリです。
  ペルソナとしては、clusterを使用している老若男女全てユーザーです。

# URL
https://cluster-board.herokuapp.com/

# テスト用アカウント
Basic認証( ユーザー名: admin, パスワード: 2222 )
アプリアカウント( [email: ko-dai@gmail.com, password: aaa111], [email: sho-yo@gmail.com, password: aaa111] )

# 利用方法
  1: user新規登録 or ログイン

  2: トップページに一覧表示されている掲示板から掲示板ページに移動
     または、掲示板新規作成ページへ移動し、掲示板を作成する

  3: 掲示板ページでは、メッセージや画像を投稿し、他のユーザーとコミュニケーションを取ることができる

  4: 作成した掲示板は、作成者のみ編集と削除ができる


# アプリを作成した背景
  clusterというバーチャルSNSでできることは生活です。
  アプリ内で全てのユーザーに対してボイスチャットやメッセージでいきなり声をかけることができるのはもちろんで、
  誰かと交流し、ゲームで遊んだり、イベントで騒いだり、何かデジタルなものを作ったりといろいろできます。
  そこで自分がプレイしてみて思ったのは、友達が欲しい、何を目的を持って仲間と何かをしたい。と思いましたが、
  どうやって友達を作ろう。どうやってワールドやアバターを作ったり、イベントを開催できるのだろう。と思いました。
  もちろんネットで調べたら出てくることですが、こういう同じ悩みを持ったを仲間や教えてくれる人を集い交流することが醍醐味なのだと思いました。
  しかし、友達を作るのも、同じ目的や悩みがある人を見つけるときも、仮想空間での生活も現実世界での生活と同じで、
  街中を歩き回り、すれ違う人にいきなり声をかけて「友達になってください」、「一緒に何々をしませんか？」と
  声を掛けたりはするのはしにくいものです。
  いろんな人が生活しているわけですから、声がかけるのに勇気が出ない人がいれば、いきなり声を掛けられてびっくりする人。
  勧誘を受けるのが嫌な人だっていると思います。
  そこで私はclusterユーザー向けに、同じ目的を持った仲間を見つけるための掲示板があればいいなと思い、作成しようと思いました。

  例えば、「女性限定でボイスチャット有り、一緒にワールドを回れる仲間を募集」をしたり。
  または、「アバターの作成方法やコツを教えてもらいたいが、話すのは苦手でクラスター内でチャットのみでお願いしたい」だったり。
  それぞれのユーザーの目的に合った掲示板を作成し、同じ目的を持ったユーザーを集うことができる掲示板を作れば
  clusterの生活がより楽しくなるのではないと思い、作成することを決めました。


# 洗い出した要件
  https://docs.google.com/spreadsheets/d/1_JKc7ulPhrCQBddTdLYjEB6D5y_nD89P_IskyR8FcJc/edit#gid=982722306

# 実装した機能について
  ・ユーザー登録機能
  ・掲示板新規作成機能
  ・掲示板内メッセージ、画像投稿機能


# 実装予定の機能
  ・掲示板新規作成ページのビューファイルのコーディング
  ・マイページ機能実装
  ・お気に入り機能実装
  ・検索機能実装
  ・カテゴリー検索機能実装

# データベース設計と画面遷移図
  作成していたのですが、エラーのため表示されない状態でエラー対応中です。

# 開発環境
  HTML,CSS,Ruby,Ruby on Rails

# 工夫したポイント
  ・ユーザー登録や掲示板作成時の入力欄にActiveHashを使用


# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| gender_id          | integer | null: false |
| introduction       | text    | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

### Association

- has_many :rooms
- has_many :messages

## rooms テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| room_name   | string     | null: false                    |
| category_id | integer    | null: false                    |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |



### Association
- belongs_to :room
- has_many :messages


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user