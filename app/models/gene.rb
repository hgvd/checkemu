class Gene < ActiveRecord::Base
  has_many :article_genes
  has_many :articles, :through => :article_genes

  def patterns
    [name, symbol, synonyms.split(/\|/), name.gsub(/[- ]/, '.')].reject{|p| p.blank?}
  end
end
