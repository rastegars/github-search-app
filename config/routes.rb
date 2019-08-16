Rails.application.routes.draw do
  root :to => 'repositories#index'
  get 'repositories/index'
end
