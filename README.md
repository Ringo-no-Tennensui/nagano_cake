# ながのCAKE　ECサイト
<img alt="Nagano-Caki-Logo0" src="https://github.com/uswitch-02/bookers2/assets/124918064/85ee0fd3-4ec7-4338-8853-0bb3c54df4bb" width = >

---
* [概要](#概要)
* [使用している言語フレームワークのバージョン](#使用している言語フレームワークのバージョン)
* [実装した機能](#実装した機能)
* [管理者ページへのログイン方法](#管理者ページへのログイン方法)
---
# 概要
長野県にある洋菓子店「ながのCAKE」の商品の通販を想定した、ECサイトを開発しました。<br>
このECサイトはDMM WEB CAMP生によるチーム開発課題です。<br>
実在するお店のサイトではありませんのでご了承ください。
# メンバー
 - ジュンヤ
 - カナザワ
 - イズミ
 - ナベ

# 使用している言語フレームワークのバージョン
 - ruby 3.1.2
 - Rails 6.1.7.3
 - Bootstrap v4.5.3

# 実装した機能
- 顧客側
    - 会員登録、ログイン・ログアウト、退会
    - 会員情報の編集
    - カートへの追加、商品購入
    - 支払い方法、配送先の指定
    - 配送先の登録、編集

- 管理者側
    - 商品の新規追加、編集
    - 商品情報の編集
    - 会員登録されているユーザ情報の編集、退会処理
    - 注文ステータス、制作ステータスの編集

- その他追加機能
    - 売切れ商品はカートに追加できない
    - ワード検索機能
      - 顧客側：関連ワードを使用しての「商品検索」
      - 管理者側：関連ワードを使用しての「顧客検索」
    - 商品ジャンル検索機能

#### 管理者ページへのログイン方法
~~~
email: admin@gmail.com

password: 000000
~~~
