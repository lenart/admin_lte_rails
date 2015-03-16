module AdminLteRails
  module NavigationHelper

    def nav_link_to(text, url, icon=nil)
      is_current = url.all? { |part| request.path.match(part.to_s) }
      li_class = is_current ? 'active' : ''

      content_tag :li, class: li_class do
        link_to url do
          unless icon.blank?
            concat content_tag(:i, nil, class: "fa #{icon}")
          end
          concat content_tag(:span, text)
        end
      end
    end

  end
end