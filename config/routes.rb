Rails.application.routes.draw do
  resources :campers, except: %i[destroy update]
  resources :activities, except: %i[show update create]
  resources :signups, except: %i[index show update destroy]
end
