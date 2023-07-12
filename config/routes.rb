Rails.application.routes.draw do
  get 'posts/new'
  get 'top' => 'homes#top'
  # ２ページ目のルートを追加
  get 'about' => 'homes#about'
  # 投稿ページのルートを追加
  post 'posts' => 'posts#create'
end
