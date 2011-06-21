class ArticleVariationType < ActiveRecord::Base
  belongs_to :article
  belongs_to :variation_type
end
