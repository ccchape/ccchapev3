Rails.application.routes.draw do
  get 'prodigio', to: 'category#prodigio'
  get 'junior', to: 'category#junior'
  get 'senior', to: 'category#senior'

  get 'participar', to: 'welcome#participar'
  get 'formulario', to: 'welcome#formulario'

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
