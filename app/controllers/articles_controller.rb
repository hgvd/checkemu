class ArticlesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @articles = Article.includes(:validations).order(:id).page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
    @validation = current_user.validations.where(:article_id => @article.id).first
  end

  def found
    @articles = Article.found.order(:id).page(params[:page])
    render 'index'
  end

  def missed
    @articles = Article.missed.order(:id).page(params[:page])
    render 'index'
  end

  def validate
    @article = Article.find(params[:id])
    verdict = params[:verdict].present? && ["found", "missed", "fulltext"].include?(params[:verdict]) ? params[:verdict] : nil
    @validation = current_user.validations.where(:article_id => @article.id).first
    if @validation.blank?
      @validation = current_user.validations.create(:article_id => @article.id)
    end
    @validation.verdict = verdict
    @validation.save!
    redirect_to @article
  end
end
