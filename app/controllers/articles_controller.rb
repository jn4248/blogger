class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
    #update number of page views for article
    @article.number_of_views += 1
    @article.save!
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.number_of_views = 0
    @article.save
    flash.notice = "Article Created: '#{@article.title}'"
    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article Updated: '#{@article.title}'"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article Deleted: '#{@article.title}'"
    redirect_to articles_path
  end



  def reset_number_of_views
    @article = Article.find(params[:id])
    @article.number_of_views = 0
    @article.save!
    redirect_to articles_path
  end

  def reset_number_of_views_all
    Article.update_all number_of_views: 0
    redirect_to articles_path
  end

end
