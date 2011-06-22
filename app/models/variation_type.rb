class VariationType < ActiveRecord::Base
  has_many :article_variation_types
  has_many :articles, :through => :article_variation_types

  def found_articles_count
    @found ||= articles.found.count
    @found
  end

  def missed_articles_count
    @missed ||= articles.missed.count
    @missed
  end

  def found_percentage
    (found_articles_count.to_f / articles_count * 100).round
  end

  def missed_percentage
    (missed_articles_count.to_f / articles_count * 100).round
  end
end
