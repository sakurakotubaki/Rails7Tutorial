## モデルを作成する
モデルは、データベースとやり取りをする仕組みです。データベースを使うには、RDBという別の技術が必要です。RDBを操作するときは、SQLという技術を使います。

🔧モデルの作成は以下のコマンドです。
```
rails g model モデル名
```

🔧postモデルを作るときは、以下のコマンドを実行する
```
rails g model post
```

このコマンドで一気に４つのファイルが作られます。

db/migrate/（作成日時）_create_posts.rb：「マイグレーションファイル」というデータベースの設計図
app/models/post.rb：データベースに対応したRubyのクラス
test/models/post_test.rb：モデルクラスのテストコードのひな形
test/fixtures/posts.yml：テストデータ作成のためのひな形
「マイグレーションファイル」は非常に大事なファイルです。データベースの設計図であり、テーブル名やカラム名、テーブルの列を決める記述します。ファイル内はこのような記述方法です。

## 📂以下のディレクトリに、ファイルが自動生成される
db/migrate/20230712010449_create_posts.rb
```rb
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|

      t.timestamps
    end
  end
end
```

コードの解説
```rb
def change
  create_table :テーブル名 do |t|
    t.データ型 :カラム名
  end
end
```

「t.データ型名 :カラム名」以外のところはファイルが作成された時点ですでに記述されています。
※データ型の右は半角余白が必要です。
今回は「post」モデルを作成しました。これは、旅行の写真や説明を投稿する「投稿」のモデルとして作成しました。とりあえず、カラムに「場所（location）」と「本文（text）」を追記します。両方とも文字列なので、データ型は「string」です。

```rb
class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :location
      t.string :text
      t.timestamps
    end
  end
end
```

マイグレーションファイルを変更記述しましたが、これはまだ設計図です。これをテーブルにしないといけません。マイグレーションファイルからテーブルを作成するには以下のコマンドを打ちます。

```
rails db:migrate
```

このように出れば、作成成功です。
```
== 20210418093157 CreatePosts: migrating ======================================
-- create_table(:posts)
   -> 0.0029s
== 20210418093157 CreatePosts: migrated (0.0029s) =============================
```