class GenesController < ApplicationController
  def index
    @genes = Gene.order("articles_count desc, symbol").page(params[:page])
  end

  def show
    @gene = Gene.find(params[:id])
    @articles = @gene.articles.order(:id).page(params[:page])
  end
end
