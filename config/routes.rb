AdminoExample::Application.routes.draw do
  namespace :admin do
    resources :contacts
  end

  root to: redirect('/admin/contacts')
end

