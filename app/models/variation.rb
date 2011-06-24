class Variation < ActiveRecord::Base
  belongs_to :article

  def patterns
    [mutation_pattern, position_pattern].reject{|p| p.blank?}
  end
end
