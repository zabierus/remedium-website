Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", registration: "signup" }, controllers: {
                       :confirmations => "users/confirmations",
                       :passwords => "users/passwords",
                       :registrations => "users/registrations",
                       :sessions => "users/sessions",
                     }

  namespace :admin do
    resources :home
    devise_scope :user do
      get "/login" => "sessions#index"
    end
  end

  scope module: :site do
    resources :gallery, :forms

    resources :articles do
      collection do
        get "search" => "articles#search"
        get ":id" => "articles#category", as: :category
      end
    end

    resources :subscribers do
      member do
        get "unsubscribe/:deactivation_code" => "subscribers#unsubscribe"
      end
    end

    get "download/:id" => "tracks#download_track", as: "download_track"
    get "privacy_policy" => "home#privacy_policy", as: "show_privacy_policy"
    get "privacy_policy/download" => "home#download_policy", as: "download_policy"
    get "archives" => "articles#archives"
    get "articles/category/:id" => "articles#show_category", as: "articles_category"
    get "galleries/:gallery_id/category/:category_id" => "galleries#show_category", as: "galleries_category"
    get "/sitemap.:format" => "home#sitemap"
  end

  match "/admin" => "admin/home#index", via: :get
  match "*path" => "application#not_found", via: :all

  root "site/home#index"
end
