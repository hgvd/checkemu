class ArticlesController < ApplicationController
  def index
    @articles = Article.order(:id).page(params[:page])
  end
end
