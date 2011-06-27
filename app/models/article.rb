class Article < ActiveRecord::Base
  has_many :article_variation_types
  has_many :variation_types, :through => :article_variation_types
  has_many :article_genes
  has_many :genes, :through => :article_genes
  has_many :variations
  has_many :validations

  scope :found, where("variations_count > 0")
  scope :missed, where(:variations_count => 0)

  def next_article
    Article.where("id > #{id}").order("id").limit(1).first
  end

  def previous_article
    Article.where("id < #{id}").order("id desc").limit(1).first
  end
end
