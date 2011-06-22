class VariationTypesController < ApplicationController
  def index
    @variation_types = VariationType.order(:name)
  end

  def show
    @variation_type = VariationType.find(params[:id])
    @articles = @variation_type.articles.order(:id).page(params[:page])
  end
end
