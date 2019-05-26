Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    #ルートディレクトリをindexアクションに設定
    #localhost:3000/でindexのviewファイルを表示することができる
    root "books#index"
    #使用するアクションだけ指定(無駄を省くプログラム)
    resources :books, :only => [:create, :show, :edit, :update, :destroy]

    #手動で書く場合はこんな感じ
    # post 'books' => 'books#create'
    # get 'books/:id' => 'books#show', as: 'book'  #名前付きルート
    # get 'books/:id/edit' => 'books#edit', as: 'edit_book'
    # patch 'books/:id' => 'books#update', as: 'update_book'
    # delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
