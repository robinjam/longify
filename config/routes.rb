Longify::Application.routes.draw do
  resources :links
  
  match ':id' => 'links#redirect', as: :redirect_link
  
  root to: 'links#new'
end
