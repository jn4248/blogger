class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :top_articles_by_views

  protected
  def top_articles_by_views
    limit = 3
    @top_articles_by_views = Article.order(number_of_views: :desc).first(limit)
  end

end
