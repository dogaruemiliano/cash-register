Rails.application.routes.draw do
  root to: 'products#index'

  post 'basket/:basket_id/add/:product_id', to: 'basket_items#add', as: :add_item
  post 'basket/:basket_id/remove/:product_id', to: 'basket_items#remove', as: :remove_item
end
