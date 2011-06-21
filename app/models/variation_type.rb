class VariationType < ActiveRecord::Base
  has_many :article_variation_types
  has_many :articles, :through => :article_variation_types
end
