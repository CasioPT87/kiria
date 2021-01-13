Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  scope '/logged' do
    resources :cheatsheets, only: :index
  end

end
