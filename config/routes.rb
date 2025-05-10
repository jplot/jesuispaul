Rails.application.routes.draw do
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  # root "home#index"

  if Rails.env.production?
    root to: redirect("https://www.lepotcommun.fr/pot/m230d9ye", status: 302)

    constraints host: /^(?!jesuispaul\.org$).*$/ do
      match "(*any)", via: :all, to: redirect { |_, request|
        URI.parse(request.url).tap { |uri| uri.host = "jesuispaul.org" }.to_s
      }
    end
  end

  scope controller: :wedding do
    get :mariage, action: :index
    post :mariage, action: :create
  end

  devise_for :users
end
