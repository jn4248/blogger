class TagsController < ApplicationController
  before_action :require_login, only: :destroy
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def destroy
    @tag.destroy
    flash.notice = "Tag Deleted: '#{@tag.name}'"
    redirect_to tags_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  def require_login
    unless logged_in?
      redirect_to root_path
      return false
    end
  end

end
