module StaticHelper
  def pluralize_with_html(count, word)
    "<span class='count'>#{count}</span> #{pluralize(count, word)}".html_safe
  end
end
