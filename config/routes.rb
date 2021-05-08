Rails.application.routes.draw do
  #top-page
  root 'home#top'
  
  #宿のキーワード検索ページ
  get "hotels/index_keyword_search" => "hotels#index_keyword_search"
  #宿の都道府県検索ページ
  get "hotels/index_prefectures_name_search" => "hotels#index_prefectures_name_search"
  
  get "reservations/:id/index" => "reservations#index"
  
  devise_for :users
  
  resources :hotels do
   resources :reservations
  end
  
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
