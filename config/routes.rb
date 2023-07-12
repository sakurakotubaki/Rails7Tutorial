Rails.application.routes.draw do
  get 'posts/new'
  get 'top' => 'homes#top'
  # ２ページ目のルートを追加
  get 'about' => 'homes#about'
  resources :posts
end
