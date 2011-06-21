class ArticlesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @articles = Article.order(:id).page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end
end
