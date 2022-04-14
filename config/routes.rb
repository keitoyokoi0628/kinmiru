Rails.application.routes.draw do


  root to: 'homes#top'

# ユーザー
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 scope module: :public do

    get "/customers/my_page" => "customers#show"
    resources :customers
    resources :attendances
    get '/attendances/:id/timesedit' => 'attendances#timesedit', as: 'timesedit'
    patch '/attendance/:id/timesupdate' => 'attendances#timesupdate', as: 'timesupdate'

 end


namespace :admin do
    root to: 'homes#top'
    resources :customers
    resources :locations
    resources :attendances
  end

end
