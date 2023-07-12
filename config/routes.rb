Rails.application.routes.draw do
  get 'top' => 'homes#top'
  # ２ページ目のルートを追加
  get 'about' => 'homes#about'
end
