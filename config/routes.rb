Knead::Engine.routes.draw do
  match '/_bugs', :to => 'bugs#create', :via => :post
end