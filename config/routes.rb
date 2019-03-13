Rails.application.routes.draw do
  get 'category/prodigio'
  get 'category/junior'
  get 'category/senior'
  get 'welcome/index'
  get 'welcome/participar'
  get 'welcome/formulario'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
