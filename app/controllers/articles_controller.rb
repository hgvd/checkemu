class ArticlesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @articles = Article.order(:id).page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def found
    @articles = Article.found.order(:id).page(params[:page])
    render 'index'
  end

  def missed
    @articles = Article.missed.order(:id).page(params[:page])
    render 'index'
  end
end
