Rails.application.routes.draw do
  root "counter#index"


  get "/counter", to: "counter#index"
end
