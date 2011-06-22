module ArticlesHelper
  def checkmark(count)
    checkmark = count.to_i > 0 ? "&#x2714;" : "&#x2718;"
    checkclass = count.to_i > 0 ? "ok" : "not_ok"
    "<span class=\"#{checkclass}\">#{checkmark}</span>".html_safe
  end

  def mark(text, patterns)
    patterns.each do |p|
      text.gsub!(/#{p.mutation_pattern}/)
      match = []
      match.push(p.mutation_pattern.gsub(/[\*\(\)]/, "")) if p.mutation_pattern.present?
      match.push(p.position_pattern.gsub(/[\*\(\)]/, "")) if p.position_pattern.present?
      text.gsub!(/(#{match.compact.join("|")})/i, '<span class="variation">\1</span>')
    end
    text.html_safe
  end
end
