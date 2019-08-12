class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to @article
  end

  def edit
  end

  def update
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to articles
  end

private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
   params.require(:article).permit(:title, :description)
  end
  
  # add edit and update methods here
end

# @article = Article.find(params[:id])
#     @article.update(title: params[:article][:title], description: params[:article][:description])
#     redirect_to article_path(@article)