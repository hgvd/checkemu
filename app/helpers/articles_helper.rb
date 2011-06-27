module ArticlesHelper
  def checkmark(count)
    checkmark = count.to_i > 0 ? "&#x2714;" : "&#x2718;"
    checkclass = count.to_i > 0 ? "ok" : "not_ok"
    "<span class=\"#{checkclass}\">#{checkmark}</span>".html_safe
  end

  def mark(text, patterns)
    patterns.each_with_index do |pattern, i|
      if pattern.size > 0
        regex = pattern.flatten.reject{|p| p.blank?}.compact.uniq.sort {|a, b| b.length <=> a.length}.join("|").gsub(/([\(\)])/, '\\\\\1')
        text.gsub!(/(#{regex})/i, "<span class=\"mark_#{i}\">\\1</span>")
      end
    end
    text.gsub!(/((no|lack of) (association|linkage|evidence|significant difference)|unlikely|do not|don't|can not|can't)/i, '<span class="no_evidence">\1</span>')
    text.html_safe
  end

  def validated?(article, user)
    validated = article.validations.map{|v| v.user_id}.include?(user.try(:id)) ? true :false
    if validated
      return '<span class="validated">validated</span>'.html_safe
    else
      return ""
    end
  end
end
