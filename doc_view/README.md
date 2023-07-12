# README
新しいWebページを追加する方法
## 🎮コントローラーを作成する

## 📗例
```
rails g controller コントローラ名
```

## 🔧homeというページを追加したいとき
```
rails g controller homes
```

## 🔨もしコントローラ名を間違えたりして消したい場合は、以下のコマンドです。「d」は「destroy」の略です。
```
rails d controller コントローラ名
```

作成されたhomesコントローラ内に「top」アクションを定義しましょう。
urlにアクセスするときに、/topと付けるのに、使用する。
```rb
class HomesController < ApplicationController
  # defで処理が始まって
  def top
  end
  # endで処理が終わる
end
```

## ルーティングを設定する
config/routes.rbにルートを設定する。これができればWebページを表示できる。
```rb
Rails.application.routes.draw do
  get 'top' => 'homes#top'
end
```

## Viewを作成する
app/views/homes/top.html.erbに、Webページを作成する。
```rb
<h1>Topページ</h1>
```

ローカルサーバーを起動して、URLにアクセスする。
```
rails s
```

http://127.0.0.1:3000/top

## 🔧同じhomesディレクトリにページを追加する場合
1. 先ほど作成したコントローラーに、urlにアクセスするためのアクションを追加
```rb
class HomesController < ApplicationController
  # ここにアクションを記述していく
  def top
  end
  # ２ページ目
  def about
  end
end
```

2. ルートの追加をする
```rb
Rails.application.routes.draw do
  get 'top' => 'homes#top'
  # ２ページ目のルートを追加
  get 'about' => 'homes#about'
end
```

3. urlにアクセスして、Webページが表示されたら、OK!
http://127.0.0.1:3000/about