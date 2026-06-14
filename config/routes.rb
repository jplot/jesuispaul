Rails.application.routes.draw do
  get 'home/index'

  get 'up' => 'rails/health#show', as: :rails_health_check

  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest

  if Rails.env.production?
    root to: redirect("https://www.lepotcommun.fr/cagnotte/solidaire/soutenons-la-famille-de-paul-varry-a-obtenir-justice-m230d9ye/participation", status: 302)

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
