class ArticlesController < ApplicationController
  def index
    # @params = params

    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

=begin
  redirect_to will cause the browser to make a new request, whereas render renders the specified
  view for the current request. It is important to use redirect_to after mutating the database or
  application state. Otherwise, if the user refreshes the page, the browser will make the same
  request, and the mutation will be repeated.
=end

  def create
    # @article = Article.new(title: params[:article[:title]], body: params[:article][:body])
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article # "http://localhost:3000/articles/#{@article.id}"
    else
      render :new, status: :unprocessable_entity # app/views/articles/new.html.erb
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      redirect_to articles_path, status: :see_other
    else
      render @article, status: :unprocessable_entity
    end

    # @article = Article.find(params[:id])
    # @article.destroy

    # redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
