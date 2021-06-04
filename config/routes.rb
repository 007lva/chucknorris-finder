Rails.application.routes.draw do
  resources :searches, except: %i[new destroy]
end
