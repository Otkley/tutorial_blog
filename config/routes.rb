Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "articles#index"

  # get "/articles/new", to: "articles#new" new_article_path
  # post "/articles", to: "articles#create"
  # get "/articles/:id", to: "articles#show" article_path helper returns "/articles/#{article.id}"
  # get "/articles", to: "articles#index" articles_path
  # get "/articles/:id/edit" to: "articles#edit" edit_article_path
  # patch "/articles/:id" to: "articles#update"
  # delete "/articles/:id" to: "articles#destroy"

  # resources :articles

  # get "/articles/:articles_id/comments/new", to: "comments#new" new_article_path
  # post "/articles/:articles_id/comments", to: "comments#create"
  # get "/articles/:articles_id/comments/:id", to: "comments#show" comments_path helper returns "/articles/1/comments/#{comments.id}"
  # get "/articles/:articles_id/comments", to: "comments#index" comments_path
  # get "/articles/:articles_id/comments/:id/edit" to: "comments#edit" edit_article_path
  # patch "/articles/:articles_id/comments/:id" to: "comments#update"
  # delete "/articles/:articles_id/comments/:id" to: "comments#destroy"

  resources :articles do
    resources :comments
  end

=begin
You can nest resources within other nested resources if you like. For example:

resources :publishers do
  resources :magazines do
    resources :photos
  end
end

Deeply-nested resources quickly become cumbersome. In this case, for example, the application
would recognize paths such as:

  /publishers/1/magazines/2/photos/3

The corresponding route helper would be publisher_magazine_photo_url, requiring you to specify
objects at all three levels. Indeed, this situation is confusing enough that a popular article
by Jamis Buck proposes a rule of thumb for good Rails design:

Resources should never be nested more than 1 level deep.
=end
end
