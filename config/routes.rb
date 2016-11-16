Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/contacts", to: "contacts#contacts"

  get "/create_contact", to: "contacts#create_contact"
  post "/new_contact", to: "contacts#new_contact"

  get "/contacts/:id", to: "contacts#show"

  get "/contacts/:id/edit", to: "contacts#edit"
  patch "/contacts/:id", to: "contacts#update"

  delete "/contacts/:id", to: "contacts#destroy"

end
