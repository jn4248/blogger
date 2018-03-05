class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :reset_number_of_views]

  def index
    # sort types: date_asc, date_desc, views_asc, views_desc
    sort_type = params[:sort]
    if sort_type == "date_asc"
      @articles = Article.order(created_at: :asc)
    elsif sort_type == "date_desc"
      @articles = Article.order(created_at: :desc)
    elsif sort_type == "views_asc"
      @articles = Article.order(number_of_views: :asc)
    elsif sort_type == "views_desc"
      @articles = Article.order(number_of_views: :desc)
    else #default loading if no parameter passed (eg /articles)
      @articles = Article.order(created_at: :desc)
    end
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
    @article.number_of_views += 1
    @article.save!
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.number_of_views = 0
    @article.save
    flash.notice = "Article Created: '#{@article.title}'"
    redirect_to article_path(@article)
  end

  def update
    @article.update(article_params)
    flash.notice = "Article Updated: '#{@article.title}'"
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash.notice = "Article Deleted: '#{@article.title}'"
    redirect_to articles_path
  end



  def reset_number_of_views
    @article.number_of_views = 0
    @article.save!
    redirect_to article_path(@article)
  end

  def reset_number_of_views_all
    Article.update_all number_of_views: 0
    redirect_to articles_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

end
