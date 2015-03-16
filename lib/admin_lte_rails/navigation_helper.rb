module AdminLteRails
  module NavigationHelper

    def nav_link_to(text, url, icon=nil)
      li_class = current_page?(url) ? 'active' : ''

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