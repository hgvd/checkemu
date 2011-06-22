class Article < ActiveRecord::Base
  has_many :article_variation_types
  has_many :variation_types, :through => :article_variation_types
  has_many :article_genes
  has_many :genes, :through => :article_genes
end
