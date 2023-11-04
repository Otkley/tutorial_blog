class ArticlesController < ApplicationController
  def index
    # @params = params

    @articles = Article.all
  end
end
