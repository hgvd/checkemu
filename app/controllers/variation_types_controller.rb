class VariationTypesController < ApplicationController
  def index
    @variation_types = VariationType.order(:name).page(params[:page])
  end

  def show
    @variation_type = VariationType.find(params[:id])
    @articles = @variation_type.articles.order(:id).page(params[:page])
  end
end
